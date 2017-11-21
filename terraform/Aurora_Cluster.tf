resource "aws_rds_cluster" "default" {
  cluster_identifier              = "${var.service}-${var.name}-${var.env}"
  master_username                 = "${var.username}"
  master_password                 = "${var.password}"
  backup_retention_period         = 5
  preferred_backup_window         = "19:30-20:00"
  preferred_maintenance_window    = "wed:20:15-wed:20:45"
  port                            = 3306
  vpc_security_group_ids          = ["${var.security_group_ids}"]
  db_subnet_group_name            = "${var.subnet_group_name}"
  storage_encrypted               = "${var.storage_encrypted}"
  db_cluster_parameter_group_name = "${aws_rds_cluster_parameter_group.default.name}"

  tags {
    Name    = "${var.service}_${var.name}_${var.env}"
    Service = "${var.service}"
    Env     = "${var.env}"
  }
}

resource "aws_rds_cluster_instance" "default" {
  count = "${var.cluster_instance_count}"

  identifier              = "${var.service}-${var.name}-${var.env}-${count.index}"
  cluster_identifier      = "${aws_rds_cluster.default.id}"
  instance_class          = "${var.cluster_instance_class}"
  db_subnet_group_name    = "${var.subnet_group_name}"
  db_parameter_group_name = "${aws_db_parameter_group.default.name}"
  monitoring_role_arn     = "${aws_iam_role.monitoring.arn}"
  monitoring_interval     = 60

  tags {
    Name    = "${var.service}_${var.name}_${var.env}"
    Service = "${var.service}"
    Env     = "${var.env}"
  }
}
