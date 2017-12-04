resource "aws_elasticache_replication_group" "redis" {
  replication_group_id          = "${var.redis_name}"
  replication_group_description = "${var.redis_description}}"
  number_cache_clusters         = "${var.redis_clusters}"
  node_type                     = "${var.redis_node_type}"
  automatic_failover_enabled    = "${var.redis_failover}"
  engine_version                = "${var.redis_version}"
  port                          = "${var.redis_port}"
  parameter_group_name          = "${aws_elasticache_parameter_group.redis_parameter_group.id}"
  subnet_group_name             = "${var.subnet_group}"
  security_group_ids            = ["${var.sg_id}"]
  apply_immediately             = "${var.apply_immediately}"
}

resource "aws_elasticache_parameter_group" "redis_parameter_group" {
  name = "${var.parameter_group_name}"
  description = "${var.parameter_group_description}"
  family      = "redis${replace(var.redis_version, "/\\.[\\d]+$/","")}"

  parameter   = ["${var.elasticache_parameters}"]
}
