############################
## aws_rds_cluster
############################

resource "aws_rds_cluster" "default" {
  cluster_identifier              = "${var.service}-${var.env}-${var.cluster_name}"
  database_name                   = "${var.database_name}"
  master_username                 = "${var.username}"
  master_password                 = "${var.password}"
  backup_retention_period         = 1
  preferred_backup_window         = "17:54-18:24"
  preferred_maintenance_window    = "wed:01:00-wed:01:30"
  port                            = 3306
  vpc_security_group_ids          = ["sg-408a6539"]
  db_subnet_group_name            = "${var.subnet_group_name}"
  storage_encrypted               = "${var.storage_encrypted}"
  db_cluster_parameter_group_name = "${aws_rds_cluster_parameter_group.default.name}"
}
