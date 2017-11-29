#####################################
# Security Group Settints
#####################################
resource "aws_security_group" "bastion" {
  name        = "${var.name}"
  description = "Bastion security group"

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}
