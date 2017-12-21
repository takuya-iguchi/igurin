#################
# Security group
#################
resource "aws_security_group" "sg_create" {

  name        = "${var.name}"
  description = "${var.description}"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"

}

#################
# Security Rule
#################
resource "aws_security_group_rule" "ingress_rules" {
  count = "${length(var.ingress_rules)}"

  security_group_id = "${aws_security_group.sg_create.id}"

  type              = "ingress"

  cidr_blocks      = ["${lookup(var.ingress_rules[count.index], "cidr_blocks")}"]
  description      = "${lookup(var.ingress_rules[count.index], "description")}"
  from_port = "${lookup(var.ingress_rules[count.index], "from_port")}"
  to_port   = "${lookup(var.ingress_rules[count.index], "to_port")}"
  protocol  = "${lookup(var.ingress_rules[count.index], "protocol")}"
}

resource "aws_security_group_rule" "ingress_self_rules" {
  count = "${length(var.ingress_self_rules)}"

  security_group_id = "${aws_security_group.sg_create.id}"

  type              = "ingress"

  self      = "${lookup(var.ingress_self_rules[count.index], "self")}"
  description      = "${lookup(var.ingress_rules[count.index], "description")}"
  from_port = "${lookup(var.ingress_self_rules[count.index], "from_port")}"
  to_port   = "${lookup(var.ingress_self_rules[count.index], "to_port")}"
  protocol  = "${lookup(var.ingress_self_rules[count.index], "protocol")}"
}

resource "aws_security_group_rule" "egress_rules" {
  count = "${length(var.egress_rules)}"

  security_group_id = "${aws_security_group.sg_create.id}"

  type              = "egress"

  cidr_blocks      = ["${lookup(var.egress_rules[count.index], "cidr_blocks")}"]

  from_port = "${lookup(var.egress_rules[count.index], "from_port")}"
  to_port   = "${lookup(var.egress_rules[count.index], "to_port")}"
  protocol  = "${lookup(var.egress_rules[count.index], "protocol")}"
}
