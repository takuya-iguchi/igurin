resource "aws_security_group" "default" {
    name = "${var.service}-${var.env}-${var.security_group_name}"
    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["202.32.5.153/32"]
    }
    description = "Aurora"
}
