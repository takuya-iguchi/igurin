module "vpc" {
  source = "./vpc"

  name = "test"
  cidr = "172.20.0.0/16"
  azs             = ["ap-northeast-1a","ap-northeast-1c"]
  private_subnets = ["172.20.100.0/24", "172.20.101.0/24"]
  public_subnets  = ["172.20.10.0/24", "172.20.11.0/24"]

  tags = {
    Terraform = "true"
  }
}
