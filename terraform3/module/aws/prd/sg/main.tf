#################
# Security group
#################
resource "aws_security_group" "sg_create" {
  count = "${length(var.name)}"

  name        = "${var.name[count.index]}"
  description = "${var.description[count.index]}"
  vpc_id      = "${var.vpc_id}"
  tags = "${merge(var.tags, map("Name", format("%s", var.name[count.index])))}"
}

#################
# Security Rule
#################
resource "aws_security_group_rule" "ingress_rules" {
  count = "${length(var.cidr_blocks)}"

  security_group_id = "${aws_security_group.sg_create.id}"
  type              = "ingress"

  cidr_blocks      = ["${var.cidr_blocks[count.index]}"]

  from_port = "${var.from_port[count.index]}"
  to_port   = "${var.to_port[count.index]}"
  protocol  = "${var.protocol[count.index]}"
}

resource "aws_security_group_rule" "egress_rules" {
  count = "${length(var.egress_cidr_blocks)}"

  security_group_id = "${aws_security_group.sg_create.id}"
  type              = "egress"

  cidr_blocks      = ["${var.egress_cidr_blocks[count.index]}"]

  from_port = "${var.egress_from_port[count.index]}"
  to_port   = "${var.egress_to_port[count.index]}"
  protocol  = "${var.egress_protocol[count.index]}"
}
