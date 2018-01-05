module "sg_default" {
  source = "../../module/aws/sg"
  vpc_id = "${module.vpc.vpc_id}"


  tags = {"Terraform" = "true" "env" = "dev"}
  name = "sakura-dev-default"
  description = "sakura-dev-default"

  ingress_self_rules = [{self="true" from_port = 0 to_port = 0 protocol = "-1" description = "from Self SG"}]
  ingress_rules = [{cidr_blocks = "10.36.80.0/20" from_port = 0 to_port = 0 protocol = "-1"  description = "from mng"}]
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
