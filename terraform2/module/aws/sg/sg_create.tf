#################
# Security group
#################
resource "aws_security_group" "prd" {
  name        = "${var.name_prd}"
  description = "${var.description_prd}"
  vpc_id      = "${var.vpc_id}"
  tags = "${merge(var.tags, map("Name", format("%s", var.name_prd)))}"
}

resource "aws_security_group" "stg" {
  name        = "${var.name_stg}"
  description = "${var.description_stg}"
  vpc_id      = "${var.vpc_id}"
  tags = "${merge(var.tags, map("Name", format("%s", var.name_stg)))}"
}

resource "aws_security_group" "other" {
  name        = "${var.name_other}"
  description = "${var.description_other}"
  vpc_id      = "${var.vpc_id}"
  tags = "${merge(var.tags, map("Name", format("%s", var.name_other)))}"
}

#################
# Security Rule
#################
resource "aws_security_group_rule" "ingress_rules_prd" {
  count = "${length(var.cidr_blocks_prd)}"

  security_group_id = "${aws_security_group.prd.id}"
  type              = "ingress"

  cidr_blocks      = ["${var.cidr_blocks_prd[count.index]}"]

  from_port = "${var.from_port_prd[count.index]}"
  to_port   = "${var.to_port_prd[count.index]}"
  protocol  = "${var.protocol_prd[count.index]}"
}

resource "aws_security_group_rule" "ingress_rules_stg" {
  count = "${length(var.cidr_blocks_stg)}"

  security_group_id = "${aws_security_group.stg.id}"
  type              = "ingress"

  cidr_blocks      = ["${var.cidr_blocks_stg[count.index]}"]

  from_port = "${var.from_port_stg[count.index]}"
  to_port   = "${var.to_port_stg[count.index]}"
  protocol  = "${var.protocol_stg[count.index]}"
}

resource "aws_security_group_rule" "ingress_rules_other" {
  count = "${length(var.cidr_blocks_other)}"

  security_group_id = "${aws_security_group.other.id}"
  type              = "ingress"

  cidr_blocks      = ["${var.cidr_blocks_other[count.index]}"]

  from_port = "${var.from_port_other[count.index]}"
  to_port   = "${var.to_port_other[count.index]}"
  protocol  = "${var.protocol_other[count.index]}"
}
