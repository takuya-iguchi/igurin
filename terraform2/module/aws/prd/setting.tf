variable "tags" {type = "map"}
variable "azs" {type = "list"}
variable "public_subnets" {type = "list"}
variable "public_subnets_name" {type = "list"}
variable "private_subnets" {type = "list"}
variable "private_subnets_name" {type = "list"}
variable "create_database_subnet_group" {}
variable "create_elasticache_subnet_group" {}
variable "private_route_table_name" {type = "list"}
variable "public_route_table_name" {}
variable "db_subnet_gourp_name" {}
variable "db_subnet_gourp_description" {}
variable "elasticache_subnet_gourp_name" {}
variable "elasticache_subnet_gourp_description" {}
variable "vpc_id" {}
variable "igw_id" {}
variable "sg_name" {type = "list"}
variable "sg_description" {type = "list"}
variable "cidr_blocks" {type = "list"}
variable "from_port" {type = "list"}
variable "to_port" {type = "list"}
variable "protocol" {type = "list"}
variable "egress_cidr_blocks" {type = "list"}
variable "egress_from_port" {type = "list"}
variable "egress_to_port" {type = "list"}
variable "egress_protocol" {type = "list"}
variable "ec2_name" {type = "list"}
variable "instance_type" {type = "list"}
variable "subnet_id" {type = "list"}
variable "key_name" {}
variable "monitoring" {}
variable "iam_instance_profile" {}
variable "ebs_optimized" {}
variable "root_block_device" {type = "list"}
variable "ebs_block_device" {type = "list"}
variable "availability_zone" {type = "list"}
variable "private_ip" {type = "list"}
variable "monitoring_role_name" {}
variable "cluster_name" {}
variable "database_name" {}
variable "username" {}
variable "password" {}
variable "backup" {}
variable "backup_window" {}
variable "mente_window" {}
variable "port" {}
variable "storage_encrypted" {}
variable "instance_name" {}
variable "cluster_instance_count" {}
variable "cluster_instance_class" {}
variable "monitor_intarval" {}
variable "parameter_group_name" {}
variable "parameter_group_description" {}
variable "cluster_parameter_group_name" {}
variable "cluster_parameter_description" {}

output "public_subnets"   { value = "${module.vpc.public_subnets}" }
output "private_subnets"   { value = "${module.vpc.private_subnets}" }

module "vpc" {
  source = "./vpc"

  tags = "${var.tags}"
  azs             = "${var.azs}"
  public_subnets  = "${var.public_subnets}"
  public_subnets_name = "${var.public_subnets_name}"
  private_subnets = "${var.private_subnets}"
  private_subnets_name = "${var.private_subnets_name}"
  create_database_subnet_group = "${var.create_database_subnet_group}"
  create_elasticache_subnet_group = "${var.create_elasticache_subnet_group}"
  private_route_table_name = "${var.private_route_table_name}"
  public_route_table_name = "${var.public_route_table_name}"
  db_subnet_gourp_name    = "${var.db_subnet_gourp_name}"
  db_subnet_gourp_description = "${var.db_subnet_gourp_description}"
  elasticache_subnet_gourp_name = "${var.elasticache_subnet_gourp_name}"
  elasticache_subnet_gourp_description  = "${var.elasticache_subnet_gourp_description}"
  vpc_id = "${var.vpc_id}"
  igw_id = "${var.igw_id}"
}

module "sg" {
  source = "./sg"

  tags = "${var.tags}"
  vpc_id = "${var.vpc_id}"
  name = "${var.sg_name}"
  description = "${var.sg_description}"
  cidr_blocks = "${var.cidr_blocks}"
  from_port = "${var.from_port}"
  to_port = "${var.to_port}"
  protocol = "${var.protocol}"

  egress_cidr_blocks = "${var.egress_cidr_blocks}"
  egress_from_port = "${var.egress_from_port}"
  egress_to_port = "${var.egress_to_port}"
  egress_protocol = "${var.egress_protocol}"
}

module "ec2" {
  source = "./ec2"

  tags = "${var.tags}"
  name = "${var.ec2_name}"
  instance_type = "${var.instance_type}"
  subnet_id = "${var.subnet_id}"
  key_name = "${var.key_name}"
  monitoring = "${var.monitoring}"
  vpc_security_group_ids = ["${module.sg.sg_id}"]
  iam_instance_profile = "${var.iam_instance_profile}"
  private_ip = "${var.private_ip}"
  ebs_optimized = "${var.ebs_optimized}"
  root_block_device = "${var.root_block_device}"
  ebs_block_device = "${var.ebs_block_device}"
  availability_zone = "${var.availability_zone}"
}

module "aurora" {
  source = "./aurora"

  monitoring_role_name = "${var.monitoring_role_name}"

  cluster_name  = "${var.cluster_name}"
  database_name = "${var.database_name}"
  username      = "${var.username}"
  password      = "${var.password}"
  backup        = "${var.backup}"
  backup_window = "${var.backup_window}"
  mente_window  = "${var.mente_window}"
  port          = "${var.port}"
  security_group_id = "${module.sg.sg_id}"
  subnet_group_name = "${module.vpc.db_subnet_id}"
  storage_encrypted = "${var.storage_encrypted}"

  instance_name = "${var.instance_name}"
  cluster_instance_count = "${var.cluster_instance_count}"
  cluster_instance_class = "${var.cluster_instance_class}"
  monitor_intarval = "${var.monitor_intarval}"

  parameter_group_name = "${var.parameter_group_name}"
  parameter_group_description = "${var.parameter_group_description}"

  cluster_parameter_group_name = "${var.cluster_parameter_group_name}"
  cluster_parameter_description = "${var.cluster_parameter_description}"
}

#module "beanstalk" {
#  source = "./beanstalk"
#}
