module "peering" {
  source = "../../module/aws/peering"
  vpc_id   = "${module.vpc.vpc_id}"

  remote_cidr = "10.36.80.0/20"
  remote_subnet = ["10.36.80.0/22","10.36.88.0/22"]

  cidr = "10.36.0.0/20"
  public_subnet  = ["10.36.0.0/22", "10.36.4.0/22"]
  private_subnet = ["10.36.8.0/22", "10.36.12.0/22"]

  public_route_table_id  = "${module.vpc.public_route_table}"
  private_route_table_id = "${module.vpc.private_route_table}"
}
