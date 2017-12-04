module "ec2" {
  source = "../../module/aws/other/ec2"

  tags = {"Terraform" = "true" "env" = "other"}
  name = ["sakura"]
  instance_type = ["t2.nano"]
  subnet_id = ["${module.vpc.public_subnets}"]
  key_name = "WEB"
  monitoring = "true"
  vpc_security_group_ids = ["${module.sg.sg_id}"]
  iam_instance_profile = "EC2"
  private_ip = ["10.36.44.10"]
  ebs_optimized = "false"
  root_block_device = [{volume_size = "30" volume_type = "gp2"}]
  ebs_block_device = [{device_name = "/dev/sdf" volume_size = "100" volume_type = "gp2" encrypted = "true"}]
  availability_zone = ["ap-northeast-1c"]
}
