#####################################
# Security Group Settints
#####################################
resource "aws_security_group" "bastion" {
  name        = "${var.name}"
  description = "Bastion security group"

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}

###################################
# Ingress - List of rules (simple)
###################################
resource "aws_security_group_rule" "ingress_rules" {
  count = "${var.create ? length(var.ingress_rules) : 0}"

  security_group_id = "${aws_security_group.this.id}"
  type              = "ingress"

  cidr_blocks      = ["${var.ingress_cidr_blocks}"]
  prefix_list_ids  = ["${var.ingress_prefix_list_ids}"]

  from_port = "${element(var.rules[var.ingress_rules[count.index]], 0)}"
  to_port   = "${element(var.rules[var.ingress_rules[count.index]], 1)}"
  protocol  = "${element(var.rules[var.ingress_rules[count.index]], 2)}"
}
