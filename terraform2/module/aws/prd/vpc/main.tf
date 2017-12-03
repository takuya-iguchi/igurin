#####################################
# Public Subnets Settings
#####################################
resource "aws_subnet" "public" {
  count = "${length(var.public_subnets)}"

  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.public_subnets[count.index]}"
  availability_zone       = "${element(var.azs, count.index)}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"

  tags = "${merge(var.tags, map("Name", format("%s", var.public_subnets_name[count.index])))}"
}

#####################################
# Private Subnets Settings
#####################################
resource "aws_subnet" "private" {
  count = "${length(var.private_subnets)}"

  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.private_subnets[count.index]}"
  availability_zone = "${element(var.azs, count.index)}"

  tags = "${merge(var.tags, map("Name", format("%s", var.private_subnets_name[count.index])))}"
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
  subnet_id     = "${element(aws_subnet.public.*.id, (var.single_nat_gateway ? 0 : count.index))}"

}

#####################################
# Route Table(Public)
#####################################
resource "aws_route_table" "public" {
  count = "${length(var.public_subnets) > 0 ? 1 : 0}"

  vpc_id           = "${var.vpc_id}"
  propagating_vgws = ["${var.public_propagating_vgws}"]

  tags = "${merge(var.tags, map("Name", format("%s", var.public_route_table_name)))}"
}

resource "aws_route" "public_internet_gateway" {
  count = "${length(var.public_subnets) > 0 ? 1 : 0}"

  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${var.igw_id}"
}

resource "aws_route_table_association" "public" {
  count = "${length(var.public_subnets)}"

  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
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

  vpc_id           = "${var.vpc_id}"
  propagating_vgws = ["${var.private_propagating_vgws}"]

  tags = "${merge(var.tags, map("Name", format("%s", var.private_route_table_name[count.index])))}"

}

resource "aws_route_table_association" "private" {
  count = "${length(var.private_subnets)}"

  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}

#####################################
# db_subnet_group
#####################################
resource "aws_db_subnet_group" "database" {
  count = "${length(var.private_subnets) > 0 && var.create_database_subnet_group ? 1 : 0}"

  name        = "${var.db_subnet_gourp_name}"
  description = "${var.db_subnet_gourp_description}"
  subnet_ids  = ["${aws_subnet.private.*.id}"]
}

#####################################
# elasticache_subnet_group
#####################################
resource "aws_elasticache_subnet_group" "elasticache" {
  count = "${length(var.private_subnets) > 0 && var.create_elasticache_subnet_group ? 1 : 0}"

  name        = "${var.elasticache_subnet_gourp_name}"
  description = "${var.elasticache_subnet_gourp_description}"
  subnet_ids  = ["${aws_subnet.private.*.id}"]
}
