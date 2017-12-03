module "other" {
  source = "./module/aws/other"

  #####################################
  # Common Settings
  #####################################
  vpc_id = "${module.all.vpc_id}"
  igw_id = "${module.all.igw_id}"
  tags = {"Terraform" = "true" "env" = "other"}

  #####################################
  # VPC Settings
  #####################################
  azs             = ["ap-northeast-1a", "ap-northeast-1c"]

  public_subnets  = ["10.36.16.0/22", "10.36.44.0/22"]
  public_subnets_name = ["sakura_other_public_01_a", "sakura_other_public_01_c"]
  private_subnets = ["10.36.36.0/22", "10.36.40.0/22"]
  private_subnets_name = ["sakura_other_private_01_a", "sakura_other_private_01_c"]
  private_route_table_name = ["sakura_other_private_01_a", "sakura_other_private_01_c"]
  public_route_table_name = "sakura_other_public_01"
  create_database_subnet_group = "true"
  db_subnet_gourp_name    = "sakura"
  db_subnet_gourp_description = "sakura"
  create_elasticache_subnet_group = "true"
  elasticache_subnet_gourp_name = "sakura"
  elasticache_subnet_gourp_description  = "sakura"

  #####################################
  # Security Group Settings
  #####################################
  sg_name = ["other"]
  sg_description = ["other"]
  cidr_blocks = ["0.0.0.0/0", "202.32.5.153/32"]
  from_port   = [80, 0]
  to_port     = [80, 0]
  protocol    = ["tcp", "-1"]

  egress_cidr_blocks  = ["0.0.0.0/0"]
  egress_from_port    = [0]
  egress_to_port      = [0]
  egress_protocol     = ["-1"]

  #####################################
  # EC2 Instance Settings
  #####################################
  ec2_name = ["sakura"]
  instance_type = ["t2.nano"]
  subnet_id = ["${module.other.public_subnets}"]
  key_name = "WEB"
  monitoring = "true"
  iam_instance_profile = "EC2"
  private_ip = ["10.36.44.10"]
  ebs_optimized = "false"
  root_block_device = [{volume_size = "30" volume_type = "gp2"}]
  ebs_block_device = [{device_name = "/dev/sdf" volume_size = "100" volume_type = "gp2" encrypted = "true"}]
  availability_zone = ["ap-northeast-1c"]

  #####################################
  # Beanstalk Settings
  #####################################
  ##「./module/aws/other/beanstalk内で設定」
}
