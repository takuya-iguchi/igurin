module "sg_default" {
  source = "../../module/aws/sg"
  vpc_id = "${module.vpc_mng.vpc_id}"


  tags = {"Terraform" = "true" "env" = "mng"}
  name = "mng-default"
  description = "mng-default"

  ingress_self_rules = [{self="true" from_port = 0 to_port = 0 protocol = "-1" description = "test"}]
  ingress_rules = [{cidr_blocks = "202.32.5.153/32" from_port = 0 to_port = 0 protocol = "-1" description = "test"}]
  egress_rules = [{cidr_blocks = "0.0.0.0/0" from_port = 0 to_port = 0 protocol = "-1"}]
}

module "sg_bastion" {
  source = "../../module/aws/sg"
  vpc_id = "${module.vpc_mng.vpc_id}"

  tags = {"Terraform" = "true" "env" = "mng"}

  name = "mng-bastion"
  description = "mng-bastion"

  ingress_rules = [{cidr_blocks = "202.32.5.153/32" from_port = 22 to_port = 22 protocol = "tcp" description = "test"}]
  egress_rules = [{cidr_blocks = "0.0.0.0/0" from_port = 0 to_port = 0 protocol = "-1"}]
}

module "sg_ldap" {
  source = "../../module/aws/sg"
  vpc_id = "${module.vpc_mng.vpc_id}"

  tags = {"Terraform" = "true" "env" = "mng"}

  name = "mng-ldap"
  description = "mng-ldap"

  ingress_rules = []

  egress_rules = [{cidr_blocks = "0.0.0.0/0" from_port = 0 to_port = 0 protocol = "-1"}]
}

module "sg_sysm" {
  source = "../../module/aws/sg"
  vpc_id = "${module.vpc_mng.vpc_id}"

  tags = {"Terraform" = "true" "env" = "mng"}

  name = "mng-sysm"
  description = "mng-sysm"

  ingress_rules = []

  egress_rules = [{cidr_blocks = "0.0.0.0/0" from_port = 0 to_port = 0 protocol = "-1"}]
}

module "sg_git" {
  source = "../../module/aws/sg"
  vpc_id = "${module.vpc_mng.vpc_id}"

  tags = {"Terraform" = "true" "env" = "mng"}

  name = "mng-git"
  description = "mng-git"


  ingress_rules = [
    {cidr_blocks = "202.32.5.153/32" from_port = 80 to_port = 80 protocol = "tcp" description = "test"},
    {cidr_blocks = "202.32.5.153/32" from_port = 443 to_port = 443 protocol = "tcp" description = "test"}
  ]
  egress_rules = [{cidr_blocks = "0.0.0.0/0" from_port = 0 to_port = 0 protocol = "-1"}]
}

module "sg_deploy" {
  source = "../../module/aws/sg"
  vpc_id = "${module.vpc_mng.vpc_id}"

  tags = {"Terraform" = "true" "env" = "mng"}

  name = "mng-deploy"
  description = "mng-deploy"

  ingress_rules = [
    {cidr_blocks = "202.32.5.153/32" from_port = 80 to_port = 80 protocol = "tcp" description = "from TokyoOffice"},
    {cidr_blocks = "202.32.5.153/32" from_port = 443 to_port = 443 protocol = "tcp" description = "from TokyoOffice"}
  ]
  egress_rules = [{cidr_blocks = "0.0.0.0/0" from_port = 0 to_port = 0 protocol = "-1"}]
}

module "sg_batch" {
  source = "../../module/aws/sg"
  vpc_id = "${module.vpc_mng.vpc_id}"

  tags = {"Terraform" = "true" "env" = "mng"}

  name = "mng-batch"
  description = "mng-batch"

  ingress_rules = [
    {cidr_blocks = "202.32.5.153/32" from_port = 80 to_port = 80 protocol = "tcp" description = "from TokyoOffice"},
    {cidr_blocks = "202.32.5.153/32" from_port = 443 to_port = 443 protocol = "tcp" description = "from TokyoOffice"}
  ]
  egress_rules = [{cidr_blocks = "0.0.0.0/0" from_port = 0 to_port = 0 protocol = "-1"}]
}
