module "ec2-backend" {
  source = "../../module/aws/ec2"

  tags = {"Terraform" = "true" "env" = "dev"}

  name              = "backend-001"
  instance_type     = "c4.large"
  ami_id            = "ami-8376fbe5"
  subnet_id         = "${module.vpc.public_subnets}"
  availability_zone = "ap-northeast-1a"

  ebs_optimized = "false"
  monitoring    = "true"
  iam_instance_profile   = "backend"

  vpc_security_group_ids = ["${module.sg_default.sg_id}", "${module.sg_backend.sg_id}"]
  root_block_device      = {volume_size = "100" volume_type = "gp2"}

  enable_eip             = false
}
