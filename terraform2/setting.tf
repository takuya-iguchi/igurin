module "vpc" {
  source = "./module/aws/vpc"

  name = "sakura"
  cidr = "10.36.0.0/16"
  azs             = ["ap-northeast-1a", "ap-northeast-1c"]
  public_subnets  = ["10.36.0.0/22", "10.36.4.0/22", "10.36.8.0/22", "10.36.12.0/22", "10.36.16.0/22", "10.36.44.0/22"]
  public_subnets_name = ["sakura_prd_public_01_a", "sakura_prd_public_01_c", "sakura_stg_public_01_a", "sakura_stg_public_01_c", "sakura_other_public_01_a", "sakura_other_public_01_c"]

  public_subnets_prd  = ["10.36.0.0/22", "10.36.4.0/22"]
  public_subnets_name_prd = ["sakura_prd_public_01_a", "sakura_prd_public_01_c"]
  public_subnets_stg  = ["10.36.8.0/22", "10.36.12.0/22"]
  public_subnets_name_stg = ["sakura_stg_public_01_a", "sakura_stg_public_01_c"]
  public_subnets_other  = ["10.36.16.0/22", "10.36.44.0/22"]
  public_subnets_name_other = ["sakura_other_public_01_a", "sakura_other_public_01_c"]

  private_subnets_prd = ["10.36.20.0/22", "10.36.24.0/22"]
  private_subnets_name_prd = ["sakura_prd_private_01_a", "sakura_prd_private_01_c"]
  create_database_subnet_group_prd = "true"
  create_elasticache_subnet_group_prd = "true"

  private_subnets_stg = ["10.36.28.0/22", "10.36.32.0/22"]
  private_subnets_name_stg = ["sakura_stg_private_01_a", "sakura_stg_private_01_c"]
  create_database_subnet_group_stg = "true"
  create_elasticache_subnet_group_stg = "true"

  private_subnets_other = ["10.36.36.0/22", "10.36.40.0/22"]
  private_subnets_name_other = ["sakura_other_private_01_a", "sakura_other_private_01_c"]
}

module "sg" {
  source = "./module/aws/sg"

  vpc_id = "${module.vpc.vpc_id}"

  name_prd = "prd"
  description_prd = "prd"
  cidr_blocks_prd = ["0.0.0.0/0", "180.235.41.62/32"]
  from_port_prd = [80, 22]
  to_port_prd = [80, 22]
  protocol_prd = ["tcp", "tcp"]

  name_stg = "stg"
  description_stg = "stg"
  cidr_blocks_stg = ["0.0.0.0/0", "180.235.41.62/32"]
  from_port_stg = [80, 22]
  to_port_stg = [80, 22]
  protocol_stg = ["tcp", "tcp"]

  name_other = "other"
  description_other = "other"
  cidr_blocks_other = ["0.0.0.0/0", "180.235.41.62/32"]
  from_port_other = [80, 22]
  to_port_other = [80, 22]
  protocol_other = ["tcp", "tcp"]
}

module "aurora" {
  source = "./module/aws/aurora"

  monitoring_role_name = "monitoring"

  cluster_name_prd  = "sakura"
  database_name_prd = "sakura"
  username_prd      = "sakura"
  password_prd      = "sakurasakura"
  backup_prd        = "1"
  backup_window_prd = "17:54-18:24"
  mente_window_prd  = "wed:01:00-wed:01:30"
  port_prd          = "3306"
  security_group_id_prd ="${module.sg.security_group_id_prd}"
  subnet_group_name_prd = "${module.vpc.db_subnet_id_prd}"
  storage_encrypted_prd = "False"

  instance_name_prd = "db"
  cluster_instance_count_prd = "1"
  cluster_instance_class_prd = "db.t2.medium"
  monitor_intarval_prd = "60"

  parameter_group_name_prd = "pg"
  parameter_group_description_prd = "test"

  cluster_parameter_group_name_prd = "cpg"
  cluster_parameter_description_prd = "test"


  cluster_name_stg  = "sakura-stg"
  database_name_stg = "sakurastg"
  username_stg      = "sakura"
  password_stg      = "sakurasakura"
  backup_stg        = "1"
  backup_window_stg = "17:54-18:24"
  mente_window_stg  = "wed:01:00-wed:01:30"
  port_stg          = "3306"
  security_group_id_stg ="${module.sg.security_group_id_stg}"
  subnet_group_name_stg = "${module.vpc.db_subnet_id_stg}"
  storage_encrypted_stg = "False"

  instance_name_stg = "db-stg"
  cluster_instance_count_stg = "1"
  cluster_instance_class_stg = "db.t2.medium"
  monitor_intarval_stg = "60"

  parameter_group_name_stg = "pg-stg"
  parameter_group_description_stg = "test"

  cluster_parameter_group_name_stg = "cpg-stg"
  cluster_parameter_description_stg = "test"
}
