module "ec2-bastion" {
  source = "../../module/aws/ec2"

  tags = {"Terraform" = "true" "Env" = "mng" "Datadog"="true" "Role"="bastion"}

  name              = "mng-bastion-001"
  instance_type     = "c4.large"
  ami_id            = "ami-8376fbe5"
  subnet_id         = "${module.vpc_mng.public_subnets}"
  availability_zone = "ap-northeast-1a"

  ebs_optimized = "false"
  monitoring    = "true"
  iam_instance_profile   = "frontend"

  vpc_security_group_ids = ["${module.sg_default.sg_id}", "${module.sg_bastion.sg_id}"]
  root_block_device      = {volume_size = "100" volume_type = "gp2"}

  enable_eip             = true
}

module "ec2-ldap" {
  source = "../../module/aws/ec2"

  tags = {"Terraform" = "true" "env" = "mng"}

  name              = "mng-ldap-001"
  instance_type     = "t2.medium"
  ami_id            = "ami-8376fbe5"
  subnet_id         = "${module.vpc_mng.public_subnets}"
  availability_zone = "ap-northeast-1a"

  ebs_optimized = "false"
  monitoring    = "true"
  iam_instance_profile   = "frontend"

  vpc_security_group_ids = ["${module.sg_default.sg_id}", "${module.sg_ldap.sg_id}"]
  root_block_device      = {volume_size = "100" volume_type = "gp2"}

  enable_eip             = true
}

module "ec2-sysm" {
  source = "../../module/aws/ec2"

  tags = {"Terraform" = "true" "env" = "mng"}

  name              = "mng-sysm-001"
  instance_type     = "c4.large"
  ami_id            = "ami-8376fbe5"
  subnet_id         = "${module.vpc_mng.public_subnets}"
  availability_zone = "ap-northeast-1a"

  ebs_optimized = "false"
  monitoring    = "true"
  iam_instance_profile   = "frontend"

  vpc_security_group_ids = ["${module.sg_default.sg_id}", "${module.sg_sysm.sg_id}"]
  root_block_device      = {volume_size = "100" volume_type = "gp2"}

  enable_eip             = true
}

module "ec2_git" {
  source = "../../module/aws/ec2"

  tags = {"Terraform" = "true" "env" = "mng"}

  name              = "mng-git-001"
  instance_type     = "c4.large"
  ami_id            = "ami-8376fbe5"
  subnet_id         = "${module.vpc_mng.public_subnets}"
  availability_zone = "ap-northeast-1a"

  ebs_optimized = "false"
  monitoring    = "true"
  iam_instance_profile   = "frontend"

  vpc_security_group_ids = ["${module.sg_default.sg_id}", "${module.sg_git.sg_id}"]
  root_block_device      = {volume_size = "100" volume_type = "gp2"}
  ebs_block_device       = [{device_name = "/dev/sdf" volume_size = "500" volume_type = "gp2" encrypted = "true"}]

  enable_eip             = true
}

module "ec2_deploy" {
  source = "../../module/aws/ec2"

  tags = {"Terraform" = "true" "env" = "mng"}

  name              = "mng-deploy-001"
  instance_type     = "c4.large"
  ami_id            = "ami-8376fbe5"
  subnet_id         = "${module.vpc_mng.public_subnets}"
  availability_zone = "ap-northeast-1a"

  ebs_optimized = "false"
  monitoring    = "true"
  iam_instance_profile   = "frontend"

  vpc_security_group_ids = ["${module.sg_default.sg_id}", "${module.sg_deploy.sg_id}"]
  root_block_device      = {volume_size = "100" volume_type = "gp2"}

  enable_eip             = true
}

module "ec2_batch" {
  source = "../../module/aws/ec2"

  tags = {"Terraform" = "true" "env" = "mng"}

  name              = "mng-batch-001"
  instance_type     = "c4.large"
  ami_id            = "ami-8376fbe5"
  subnet_id         = "${module.vpc_mng.public_subnets}"
  availability_zone = "ap-northeast-1a"

  ebs_optimized = "false"
  monitoring    = "true"
  iam_instance_profile   = "frontend"

  vpc_security_group_ids = ["${module.sg_default.sg_id}", "${module.sg_batch.sg_id}"]
  root_block_device      = {volume_size = "100" volume_type = "gp2"}

  enable_eip             = true
}
