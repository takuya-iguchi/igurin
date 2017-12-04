module "vpc" {
  source = "../../module/aws/prd/vpc"

  tags = {"Terraform" = "true" "env" = "prd"}
  azs             = ["ap-northeast-1a", "ap-northeast-1c"]
  public_subnets  = ["10.36.16.0/22", "10.36.44.0/22"]
  public_subnets_name = ["sakura_prd_public_01_a", "sakura_prd_public_01_c"]
  private_subnets = ["10.36.36.0/22", "10.36.40.0/22"]
  private_subnets_name = ["sakura_prd_private_01_a", "sakura_prd_private_01_c"]
  create_database_subnet_group = "true"
  create_elasticache_subnet_group = "true"
  private_route_table_name = ["sakura_prd_private_01_a", "sakura_prd_private_01_c"]
  public_route_table_name = "sakura_prd_public_01"
  db_subnet_gourp_name    = "sakura"
  db_subnet_gourp_description = "sakura"
  elasticache_subnet_gourp_name = "sakura"
  elasticache_subnet_gourp_description  = "sakura"

  vpc_id = "${var.vpc_id}"
  igw_id = "${var.igw_id}"
}
