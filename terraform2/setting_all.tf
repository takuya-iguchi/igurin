module "all" {
  source = "./module/aws/all"

  vpc_name = "sakura"
  igw_name = "sakura-igw"
  cidr = "10.36.0.0/16"
  tags = {"Terraform" = "true" "env" = "all"}
}
