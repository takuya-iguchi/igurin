resource "aws_vpc_peering_connection" "peering" {
  vpc_id        = "${var.vpc_id}"
  peer_vpc_id   = "${data.aws_vpc.peering.id}"
  auto_accept   = true
}

resource "aws_route" "public" {
  route_table_id         = "${element(var.public_route_table_id, count.index)}"
  destination_cidr_block = "${var.remote_cidr}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.peering.id}"
}

resource "aws_route" "private" {
  count = "${length(var.private_subnet)}"

  route_table_id            = "${element(var.private_route_table_id, count.index)}"
  destination_cidr_block    = "${var.remote_cidr}"
  vpc_peering_connection_id  = "${aws_vpc_peering_connection.peering.id}"
}

resource "aws_route" "remote" {
  count = "${length(var.remote_subnet)}"

  route_table_id            = "${data.aws_route_table.peering.*.id[count.index]}"
  destination_cidr_block    = "${var.cidr}"
  vpc_peering_connection_id  = "${aws_vpc_peering_connection.peering.id}"
}
