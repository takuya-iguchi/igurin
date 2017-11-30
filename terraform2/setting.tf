module "vpc" {
  source = "./module/aws/vpc"

  name = "sakura"
  cidr = "10.36.0.0/16"
  azs             = ["ca-central-1a","ca-central-1b"]
  private_subnets = ["10.36.20.0/22", "10.36.24.0/22", "10.36.28.0/22", "10.36.32.0/22", "10.36.36.0/22", "10.36.40.0/22"]
  public_subnets  = ["10.36.0.0/22", "10.36.4.0/22", "10.36.8.0/22", "10.36.12.0/22", "10.36.16.0/22", "10.36.44.0/22"]
  public_subnets_name = ["sakura_prd_public_01_a", "sakura_prd_public_01_c", "sakura_stg_public_01_a", "sakura_stg_public_01_c", "sakura_other_public_01_a", "sakura_other_public_01_c"]
  private_subnets_name = ["sakura_prd_private_01_a", "sakura_prd_private_01_c", "sakura_stg_private_01_a", "sakura_stg_private_01_c", "sakura_other_private_01_a", "sakura_other_private_01_c"]

  database_subnets = [""]


}
