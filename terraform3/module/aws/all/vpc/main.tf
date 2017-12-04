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
# Internet Gateway Settings
#####################################
resource "aws_internet_gateway" "mod" {

  vpc_id = "${aws_vpc.mod.id}"
  tags = "${merge(var.tags, map("Name", format("%s", var.igw_name)))}"
}
