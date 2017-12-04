module "sg" {
  source = "../../module/aws/other/sg"

  tags = {"Terraform" = "true" "env" = "other"}

  vpc_id = "${var.vpc_id}"
  name = ["other"]
  description = ["other"]
  cidr_blocks = ["0.0.0.0/0", "202.32.5.153/32"]
  from_port = [80, 0]
  to_port = [80, 0]
  protocol = ["tcp", "-1"]

  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_from_port = [0]
  egress_to_port = [0]
  egress_protocol = ["-1"]
}
