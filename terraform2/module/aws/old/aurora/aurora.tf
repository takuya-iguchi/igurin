############################
## aws_rds_cluster
############################

resource "aws_rds_cluster" "prd" {
  cluster_identifier              = "${var.cluster_name_prd}"
  database_name                   = "${var.database_name_prd}"
  master_username                 = "${var.username_prd}"
  master_password                 = "${var.password_prd}"
  backup_retention_period         = "${var.backup_prd}"
  preferred_backup_window         = "${var.backup_window_prd}"
  preferred_maintenance_window    = "${var.mente_window_prd}"
  port                            = "${var.port_prd}"
  vpc_security_group_ids          = [ "${var.security_group_id_prd}"  ]
  db_subnet_group_name            = "${var.subnet_group_name_prd}"
  storage_encrypted               = "${var.storage_encrypted_prd}"
  db_cluster_parameter_group_name = "${aws_rds_cluster_parameter_group.prd.name}"
  skip_final_snapshot             = true
}

resource "aws_rds_cluster" "stg" {
  cluster_identifier              = "${var.cluster_name_stg}"
  database_name                   = "${var.database_name_stg}"
  master_username                 = "${var.username_stg}"
  master_password                 = "${var.password_stg}"
  backup_retention_period         = "${var.backup_stg}"
  preferred_backup_window         = "${var.backup_window_stg}"
  preferred_maintenance_window    = "${var.mente_window_stg}"
  port                            = "${var.port_stg}"
  vpc_security_group_ids          = [ "${var.security_group_id_stg}"  ]
  db_subnet_group_name            = "${var.subnet_group_name_stg}"
  storage_encrypted               = "${var.storage_encrypted_stg}"
  db_cluster_parameter_group_name = "${aws_rds_cluster_parameter_group.stg.name}"
  skip_final_snapshot             = true
}

############################
## rds_instance
############################

resource "aws_rds_cluster_instance" "prd" {
  count = "${var.cluster_instance_count_prd}"

  identifier              = "${var.instance_name_prd}"
  cluster_identifier      = "${aws_rds_cluster.prd.id}"
  instance_class          = "${var.cluster_instance_class_prd}"
  db_subnet_group_name    = "${var.subnet_group_name_prd}"
  db_parameter_group_name = "${aws_db_parameter_group.prd.name}"
  monitoring_role_arn     = "${aws_iam_role.monitoring.arn}"
  monitoring_interval     = "${var.monitor_intarval_prd}"
}

resource "aws_rds_cluster_instance" "stg" {
  count = "${var.cluster_instance_count_stg}"

  identifier              = "${var.instance_name_stg}"
  cluster_identifier      = "${aws_rds_cluster.stg.id}"
  instance_class          = "${var.cluster_instance_class_stg}"
  db_subnet_group_name    = "${var.subnet_group_name_stg}"
  db_parameter_group_name = "${aws_db_parameter_group.stg.name}"
  monitoring_role_arn     = "${aws_iam_role.monitoring.arn}"
  monitoring_interval     = "${var.monitor_intarval_stg}"
}

############################
## db_parameter_group
############################
resource "aws_db_parameter_group" "prd" {
  name    = "${var.parameter_group_name_prd}"
  family  = "aurora5.6"
  description = "${var.parameter_group_description_prd}"

  parameter   = ["${var.db_parameters_prd}"]
}

resource "aws_db_parameter_group" "stg" {
  name    = "${var.parameter_group_name_stg}"
  family  = "aurora5.6"
  description = "${var.parameter_group_description_stg}"

  parameter   = ["${var.db_parameters_stg}"]
}
############################
## cluster_parameter_group
############################
resource "aws_rds_cluster_parameter_group" "prd" {
  name        = "${var.cluster_parameter_group_name_prd}"
  family      = "aurora5.6"
  description = "${var.cluster_parameter_description_prd}"

  parameter   = ["${var.cluster_parameters_prd}"]
}

resource "aws_rds_cluster_parameter_group" "stg" {
  name        = "${var.cluster_parameter_group_name_stg}"
  family      = "aurora5.6"
  description = "${var.cluster_parameter_description_stg}"

  parameter   = ["${var.cluster_parameters_stg}"]
}

############################
## monitoringRole
############################
resource "aws_iam_role" "monitoring" {
  name = "${var.monitoring_role_name}"
  path = "/"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "monitoring.rds.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "monitoring" {
  role       = "${aws_iam_role.monitoring.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}
