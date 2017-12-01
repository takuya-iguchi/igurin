#
#sakura-[環境]-[ロール]-[番号]
#sakura-[環境]-[用途]
#
#例）
#インスタンス名
#sakura-prd-tool-001
#sakura-dev-backend-001
#
#ELB
#sakura-prd-api
#sakura-dev-tool
#
#s3バケット
#sakura-prd-backups


module "vpc" {
  source = "./module/aws/vpc"

  name = "sakura"
  cidr = "10.36.0.0/16"
  azs             = ["ca-central-1a", "ca-central-1b"]
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
