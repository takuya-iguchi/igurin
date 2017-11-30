#################
# Security group
#################
resource "aws_security_group" "this1" {
  name        = "${var.name1}"
  description = "${var.description1}"
  vpc_id      = "${var.vpc_id}"
  tags = "${merge(var.tags, map("Name", format("%s", var.name3)))}"
}

resource "aws_security_group" "this2" {
  name        = "${var.name2}"
  description = "${var.description2}"
  vpc_id      = "${var.vpc_id}"
  tags = "${merge(var.tags, map("Name", format("%s", var.name3)))}"
}

resource "aws_security_group" "this3" {
  name        = "${var.name3}"
  description = "${var.description3}"
  vpc_id      = "${var.vpc_id}"
  tags = "${merge(var.tags, map("Name", format("%s", var.name3)))}"
}

#################
# Security Rule
#################
resource "aws_security_group_rule" "ingress_with_cidr_blocks" {
  count = "${var.create ? length(var.ingress_with_cidr_blocks) : 0}"

  security_group_id = "${aws_security_group.this1.id}"
  type              = "ingress"

  cidr_blocks     = ["${split(",", lookup(var.ingress_with_cidr_blocks[count.index], "cidr_blocks", join(",", var.ingress_cidr_blocks)))}"]
  prefix_list_ids = ["${var.ingress_prefix_list_ids}"]

  from_port = "${lookup(var.ingress_with_cidr_blocks[count.index], "from_port", element(var.rules[lookup(var.ingress_with_cidr_blocks[count.index], "rule", "_")], 0))}"
  to_port   = "${lookup(var.ingress_with_cidr_blocks[count.index], "to_port", element(var.rules[lookup(var.ingress_with_cidr_blocks[count.index], "rule", "_")], 1))}"
  protocol  = "${lookup(var.ingress_with_cidr_blocks[count.index], "protocol", element(var.rules[lookup(var.ingress_with_cidr_blocks[count.index], "rule", "_")], 2))}"
}
