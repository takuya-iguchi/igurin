resource "aws_elasticache_cluster" "memcache" {
  cluster_id           = "${var.cluster_id}"
  engine               = "memcached"
  engine_version       = "${var.engine_version}"
  node_type            = "${var.node_type}"
  port                 = "${var.port}"
  num_cache_nodes      = "${var.num_cache_nodes}"
  parameter_group_name = "${aws_elasticache_parameter_group.memcache_parameter_group.id}"
  subnet_group_name    = "${var.subnet_group}"
  security_group_ids   = ["${var.sg_id}"]
  apply_immediately    = "${var.apply_immediately}"
}

resource "aws_elasticache_parameter_group" "memcache_parameter_group" {
  name = "${var.parameter_group_name}"
  description = "${var.parameter_group_description}"
  family      = "redis${replace(var.engine_version, "/\\.[\\d]+$/","")}"

  parameter   = ["${var.memcache_parameters}"]
}
