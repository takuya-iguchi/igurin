module "vpc" {
  source = "../../module/aws/vpc"

  tags = {"Terraform" = "true" "env" = "dev"}

  name = "sakura-dev"
  igw_name = "sakura-dev-igw"
  cidr = "10.36.64.0/20"

  azs             = ["ap-northeast-1a"]
  public_subnets  = ["10.36.64.0/22"]
  public_subnets_name = ["sakura-dev-public-01-a"]

  private_subnets = ["10.36.72.0/22"]
  private_subnets_name = ["sakura-dev-private-01-a"]

  private_route_table_name = ["sakura-dev-private-01-a"]
  public_route_table_name = "sakura-dev-public-01"
}
