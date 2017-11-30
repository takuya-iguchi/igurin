############################
## aws_rds_cluster
############################

resource "aws_rds_cluster" "default" {
  cluster_identifier              = "${var.cluster_name}"
  database_name                   = "${var.database_name}"
  master_username                 = "${var.username}"
  master_password                 = "${var.password}"
  backup_retention_period         = "${var.backup}"
  preferred_backup_window         = "${var.backup_window}"
  preferred_maintenance_window    = "${var.mente_window}"
  port                            = "${var.port}"
  vpc_security_group_ids          = [ "${aws_security_group.default.id}"  ]
  db_subnet_group_name            = "${var.subnet_group_name}"
  storage_encrypted               = "${var.storage_encrypted}"
  db_cluster_parameter_group_name = "${aws_rds_cluster_parameter_group.default.name}"
}

############################
## rds_instance
############################

resource "aws_rds_cluster_instance" "default" {
  count = "${var.cluster_instance_count}"

  identifier              = "${var.instance_name}"
  cluster_identifier      = "${aws_rds_cluster.default.id}"
  instance_class          = "${var.cluster_instance_class}"
  db_subnet_group_name    = "${var.subnet_group_name}"
  db_parameter_group_name = "${aws_db_parameter_group.default.name}"
  monitoring_role_arn     = "${aws_iam_role.monitoring.arn}"
  monitoring_interval     = "${var.monitor_intarval}"
}

############################
## db_parameter_group
############################
resource "aws_db_parameter_group" "aurora_parameter_group" {
  name    = "${var.parameter_group_name}"
  family  = "aurora5.6"
  description = "${var.parameter_group_description}"

  parameter   = ["${var.db_parameters}"]
}

############################
## cluster_parameter_group
############################
resource "aws_rds_cluster_parameter_group" "aurora_cluster_parameter_group" {
  name        = "${var.cluster_parameter_group_name}"
  family      = "aurora5.6"
  description = "${var.cluster_parameter_group_name}"

  parameter   = ["${var.cluster_parameters}"]
}

############################
## monitoringRole
############################
resource "aws_iam_role" "monitoring" {
  name = "${var.service}_${var.env}_rds_monitoring"
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
