variable "vpc_name" {}
variable "igw_name" {}
variable "cidr"     {}
variable "tags"     {type = "map"}

module "vpc" {
  source = "./vpc"

  name = "${var.vpc_name}"
  cidr = "${var.cidr}"
  igw_name = "${var.igw_name}"
  tags     = "${var.tags}"
}

output "vpc_id" { value = "${module.vpc.vpc_id}" }
output "igw_id" { value = "${module.vpc.igw_id}" }
