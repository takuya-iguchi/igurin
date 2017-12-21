module "vpc_mng" {
  source = "../../module/aws/vpc"

  tags = {"Terraform" = "true" "env" = "mng"}

  name = "mng"
  igw_name = "mng-igw"
  cidr = "10.36.80.0/20"

  azs             = ["ap-northeast-1a"]
  public_subnets  = ["10.36.80.0/22"]
  public_subnets_name = ["mng-public-01-a"]

  private_subnets = ["10.36.88.0/22"]
  private_subnets_name = ["mng_private_01_a"]

  private_route_table_name = ["mng_private_01_a"]
  public_route_table_name = "mng_public_01"
}
