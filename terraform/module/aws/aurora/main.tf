############################
## aws_rds_cluster
############################

resource "aws_rds_cluster" "this" {
  cluster_identifier              = "${var.cluster_name}"
  database_name                   = "${var.database_name}"
  master_username                 = "${var.username}"
  master_password                 = "${var.password}"
  backup_retention_period         = "${var.backup}"
  preferred_backup_window         = "${var.backup_window}"
  preferred_maintenance_window    = "${var.mente_window}"
  port                            = "${var.port}"
  vpc_security_group_ids          = [ "${var.security_group_id}" ]
  db_subnet_group_name            = "${aws_db_subnet_group.database.name}"
  storage_encrypted               = "${var.storage_encrypted}"
  db_cluster_parameter_group_name = "${aws_rds_cluster_parameter_group.this.name}"
  final_snapshot_identifier       = "${var.final_snapshot_name}"
}

############################
## rds_instance
############################

resource "aws_rds_cluster_instance" "this" {

  identifier              = "${var.instance_name}"
  cluster_identifier      = "${aws_rds_cluster.this.id}"
  instance_class          = "${var.cluster_instance_class}"
  db_subnet_group_name    = "${aws_db_subnet_group.database.name}"
  db_parameter_group_name = "${aws_db_parameter_group.this.name}"
  monitoring_role_arn     = "${data.aws_iam_role.this.arn}"
  monitoring_interval     = "${var.monitor_intarval}"
}

############################
## db_parameter_group
############################
resource "aws_db_parameter_group" "this" {
  name    = "${var.parameter_group_name}"
  family  = "aurora5.6"
  description = "${var.parameter_group_description}"

  parameter   = ["${var.db_parameters}"]
}

############################
## cluster_parameter_group
############################
resource "aws_rds_cluster_parameter_group" "this" {
  name        = "${var.cluster_parameter_group_name}"
  family      = "aurora5.6"
  description = "${var.cluster_parameter_description}"

  parameter   = ["${var.cluster_parameters}"]
}

#####################################
# db_subnet_group
#####################################
resource "aws_db_subnet_group" "database" {

  name        = "${var.db_subnet_gourp_name}"
  description = "${var.db_subnet_gourp_description}"
  subnet_ids  = ["${var.db_subnet_group_subnet_ids}"]
}
