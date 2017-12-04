module "vpc" {
  source = "../../module/aws/all/vpc"

  name = "sakura"
  igw_name = "sakura-igw"
  cidr = "10.36.0.0/16"
  tags = {"Terraform" = "true" "env" = "all"}
}

output "vpc_id" { value = "${module.vpc.vpc_id}" }
output "igw_id" { value = "${module.vpc.igw_id}" }
