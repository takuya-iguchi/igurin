module "sg_default" {
  source = "../../module/aws/sg"
  vpc_id = "${module.vpc.vpc_id}"


  tags = {"Terraform" = "true" "env" = "dev"}
  name = "dev-default"
  description = "dev-default"

  ingress_rules = [{self="true" from_port = 0 to_port = 0 protocol = "-1"}]
  egress_rules = [{cidr_blocks = "0.0.0.0/0" from_port = 0 to_port = 0 protocol = "-1"}]
}

module "sg_backend" {
  source = "../../module/aws/sg"
  vpc_id = "${module.vpc.vpc_id}"

  tags = {"Terraform" = "true" "env" = "mng"}

  name = "-dev-backend"
  description = "dev-backend"

  egress_rules = [{cidr_blocks = "0.0.0.0/0" from_port = 0 to_port = 0 protocol = "-1"}]
}

module "sg_aurora" {
  source = "../../module/aws/sg"
  vpc_id = "${module.vpc.vpc_id}"

  tags = {"Terraform" = "true" "env" = "dev"}

  name = "dev-aurora"
  description = "dev-aurora"

  egress_rules = [{cidr_blocks = "0.0.0.0/0" from_port = 0 to_port = 0 protocol = "-1"}]
}
