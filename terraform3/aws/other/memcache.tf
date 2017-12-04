module "memcache" {
  source = "../../module/aws/other/memcache"

  cluster_id = "sakura"
  node_type = "cache.t2.micro"
  port = 11211
  num_cache_nodes = 1
  parameter_group_name = "3.2.4"
  parameter_group_description = 6379
  elasticache_parameters = "${module.vpc.elasticache_subnet_id}"
  sg_id = "${module.sg.sg_id}"
  apply_immediately = "false"
  parameter_group_name = "sakura"
  parameter_group_description = "sakura"
  elasticache_parameters = []
}
