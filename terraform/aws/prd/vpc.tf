module "vpc" {
  source = "../../module/aws/vpc"

  tags = {"Terraform" = "true" "env" = "prd"}

  name = "prd"
  igw_name = "prd-igw"
  cidr = "10.36.0.0/20"

  azs             = ["ap-northeast-1a", "ap-northeast-1c"]
  public_subnets  = ["10.36.0.0/22", "10.36.4.0/22"]
  public_subnets_name = ["prd_public_01_a", "prd_public_01_c"]

  private_subnets = ["10.36.8.0/22", "10.36.12.0/22"]
  private_subnets_name = ["prd_private_01_a", "prd_private_01_c"]

  private_route_table_name = ["prd_private_01_a", "prd_private_01_c"]
  public_route_table_name = "prd_public_01"
}
