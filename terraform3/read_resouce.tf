module "all" {
  source = "./aws/all/"
}

module "other" {
  source = "./aws/other/"
  vpc_id = "${module.all.vpc_id}"
  igw_id = "${module.all.igw_id}"
}
