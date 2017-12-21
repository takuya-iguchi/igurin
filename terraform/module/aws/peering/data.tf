data "aws_vpc" "peering" {
   cidr_block   = "${var.remote_cidr}"
}

data "aws_subnet" "peering" {
  count       = "${length(var.remote_subnet)}"
  cidr_block  = "${var.remote_subnet[count.index]}"
}

data "aws_route_table" "peering" {
  count       = "${length(var.remote_subnet)}"
  subnet_id = "${data.aws_subnet.peering.*.id[count.index]}"
}
