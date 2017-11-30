#####################################
# VPC Settings
#####################################
resource "aws_vpc" "mod" {
  cidr_block           = "${var.cidr}"
  instance_tenancy     = "${var.instance_tenancy}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support   = "${var.enable_dns_support}"

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}

#####################################
# Public Subnets Settings
#####################################
resource "aws_subnet" "public_prd" {
  count = "${length(var.public_subnets_prd)}"

  vpc_id                  = "${aws_vpc.mod.id}"
  cidr_block              = "${var.public_subnets_prd[count.index]}"
  availability_zone       = "${element(var.azs, count.index)}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"

  tags = "${merge(var.tags, map("Name", format("%s", var.public_subnets_name_prd[count.index])))}"
}

resource "aws_subnet" "public_stg" {
  count = "${length(var.public_subnets_stg)}"

  vpc_id                  = "${aws_vpc.mod.id}"
  cidr_block              = "${var.public_subnets_stg[count.index]}"
  availability_zone       = "${element(var.azs, count.index)}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"

  tags = "${merge(var.tags, map("Name", format("%s", var.public_subnets_name_stg[count.index])))}"
}

resource "aws_subnet" "public_other" {
  count = "${length(var.public_subnets_other)}"

  vpc_id                  = "${aws_vpc.mod.id}"
  cidr_block              = "${var.public_subnets_other[count.index]}"
  availability_zone       = "${element(var.azs, count.index)}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"

  tags = "${merge(var.tags, map("Name", format("%s", var.public_subnets_name_other[count.index])))}"
}

#####################################
# Private Subnets Settings
#####################################
resource "aws_subnet" "private_prd" {
  count = "${length(var.private_subnets_prd)}"

  vpc_id            = "${aws_vpc.mod.id}"
  cidr_block        = "${var.private_subnets_prd[count.index]}"
  availability_zone = "${element(var.azs, count.index)}"

  tags = "${merge(var.tags, map("Name", format("%s", var.private_subnets_name_prd[count.index])))}"
}

resource "aws_subnet" "private_stg" {
  count = "${length(var.private_subnets_stg)}"

  vpc_id            = "${aws_vpc.mod.id}"
  cidr_block        = "${var.private_subnets_stg[count.index]}"
  availability_zone = "${element(var.azs, count.index)}"

  tags = "${merge(var.tags, map("Name", format("%s", var.private_subnets_name_stg[count.index])))}"
}

resource "aws_subnet" "private_other" {
  count = "${length(var.private_subnets_other)}"

  vpc_id            = "${aws_vpc.mod.id}"
  cidr_block        = "${var.private_subnets_other[count.index]}"
  availability_zone = "${element(var.azs, count.index)}"

  tags = "${merge(var.tags, map("Name", format("%s", var.private_subnets_name_other[count.index])))}"
}

#####################################
# Internet Gateway Settings
#####################################
resource "aws_internet_gateway" "mod" {
  count = "${length(var.public_subnets) > 0 ? 1 : 0}"

  vpc_id = "${aws_vpc.mod.id}"

  tags = "${merge(var.tags, map("Name", format("%s-igw", var.name)))}"
}

#####################################
# Nat Gateway Settings
#####################################
resource "aws_eip" "nateip" {
  count = "${var.enable_nat_gateway ? (var.single_nat_gateway ? 1 : length(var.azs)) : 0}"

  vpc = true
}

resource "aws_nat_gateway" "natgw" {
  count = "${var.enable_nat_gateway ? (var.single_nat_gateway ? 1 : length(var.azs)) : 0}"

  allocation_id = "${element(aws_eip.nateip.*.id, (var.single_nat_gateway ? 0 : count.index))}"
  subnet_id     = "${element(aws_subnet.public_prd.*.id, (var.single_nat_gateway ? 0 : count.index))}"

  depends_on = ["aws_internet_gateway.mod"]
}

#####################################
# Route Table(Public)
#####################################
resource "aws_route_table" "public" {
  count = "${length(var.public_subnets) > 0 ? 1 : 0}"

  vpc_id           = "${aws_vpc.mod.id}"
  propagating_vgws = ["${var.public_propagating_vgws}"]

  tags = "${merge(var.tags, map("Name", format("%s-rt-public", var.name)))}"
}

resource "aws_route" "public_internet_gateway" {
  count = "${length(var.public_subnets) > 0 ? 1 : 0}"

  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.mod.id}"
}

resource "aws_route_table_association" "public_prd" {
  count = "${length(var.public_subnets_prd)}"

  subnet_id      = "${element(aws_subnet.public_prd.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public_stg" {
  count = "${length(var.public_subnets_stg)}"

  subnet_id      = "${element(aws_subnet.public_stg.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public_other" {
  count = "${length(var.public_subnets_other)}"

  subnet_id      = "${element(aws_subnet.public_other.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}

#####################################
# Route Table(Private)
#####################################
resource "aws_route" "private_nat_gateway" {
  count = "${var.enable_nat_gateway ? length(var.azs) : 0}"

  route_table_id         = "${element(aws_route_table.private.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${element(aws_nat_gateway.natgw.*.id, count.index)}"
}

resource "aws_route_table" "private" {
  count = "${length(var.azs)}"

  vpc_id           = "${aws_vpc.mod.id}"
  propagating_vgws = ["${var.private_propagating_vgws}"]

  tags = "${merge(var.tags, map("Name", format("%s-rt-private-%s", var.name, element(var.azs, count.index))))}"
}

resource "aws_route_table_association" "private_prd" {
  count = "${length(var.private_subnets_prd)}"

  subnet_id      = "${element(aws_subnet.private_prd.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}

resource "aws_route_table_association" "private_stg" {
  count = "${length(var.private_subnets_stg)}"

  subnet_id      = "${element(aws_subnet.private_prd.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}

resource "aws_route_table_association" "private_other" {
  count = "${length(var.private_subnets_other)}"

  subnet_id      = "${element(aws_subnet.private_other.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}
#####################################
# db_subnet_group
#####################################
resource "aws_db_subnet_group" "database_prd" {
  count = "${length(var.private_subnets_prd) > 0 && var.create_database_subnet_group_prd ? 1 : 0}"

  name        = "${var.name}-prd-rds-subnet-group"
  description = "Database subnet groups for ${var.name}"
  subnet_ids  = ["${aws_subnet.private_prd.*.id}"]

  tags = "${merge(var.tags, map("Name", format("%s-database-subnet-group", var.name)))}"
}

resource "aws_db_subnet_group" "database_stg" {
  count = "${length(var.private_subnets_stg) > 0 && var.create_database_subnet_group_stg ? 1 : 0}"

  name        = "${var.name}-stg-rds-subnet-group"
  description = "Database subnet groups for ${var.name}"
  subnet_ids  = ["${aws_subnet.private_stg.*.id}"]

  tags = "${merge(var.tags, map("Name", format("%s-database-subnet-group", var.name)))}"
}

#####################################
# elasticache_subnet_group
#####################################
resource "aws_elasticache_subnet_group" "elasticache_prd" {
  count = "${length(var.private_subnets_prd) > 0 && var.create_elasticache_subnet_group_prd ? 1 : 0}"

  name        = "${var.name}-prd-elasticache-subnet-group"
  description = "Elasticache subnet groups for ${var.name}"
  subnet_ids  = ["${aws_subnet.private_prd.*.id}"]

}

resource "aws_elasticache_subnet_group" "elasticache_stg" {
  count = "${length(var.private_subnets_stg) > 0 && var.create_elasticache_subnet_group_stg ? 1 : 0}"

  name        = "${var.name}-stg-elasticache-subnet-group"
  description = "Elasticache subnet groups for ${var.name}"
  subnet_ids  = ["${aws_subnet.private_stg.*.id}"]

}
