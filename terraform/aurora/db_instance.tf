############################
## rds_instance
############################

resource "aws_rds_cluster_instance" "default" {
  count = "${var.cluster_instance_count}"

  identifier              = "${var.service}-${var.env}-${var.cluster_name}-${count.index + 1}"
  cluster_identifier      = "${aws_rds_cluster.default.id}"
  instance_class          = "${var.cluster_instance_class}"
  db_subnet_group_name    = "${var.subnet_group_name}"
  db_parameter_group_name = "${aws_db_parameter_group.default.name}"
  monitoring_role_arn     = "${aws_iam_role.monitoring.arn}"
  monitoring_interval     = 60
}
