module "vpc" {
  source = "../../module/aws/vpc"

  tags = {"Terraform" = "true" "env" = "dev"}

  name = "dev"
  igw_name = "dev-igw"
  cidr = "10.36.64.0/20"

  azs             = ["ap-northeast-1a","ap-northeast-1c"]
  public_subnets  = ["10.36.64.0/22","10.36.68.0/22"]
  public_subnets_name = ["dev-public-01-a","dev-public-01-c"]

  private_subnets  = ["10.36.72.0/22","10.36.76.0/22"]
  private_subnets_name = ["dev-private-01-a","dev-private-01-c"]

  private_route_table_name = ["dev-private-01-a","dev-private-01-c"]
  public_route_table_name = "dev-public-01"
}
