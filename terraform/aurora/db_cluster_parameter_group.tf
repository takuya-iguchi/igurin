############################
## cluster_parameter_group
############################

resource "aws_rds_cluster_parameter_group" "default" {
  name        = "${var.service}-${var.env}-${var.cluster_parameter_group_name}"
  family      = "aurora5.6"
  description = "${var.service}-${var.env}-${var.cluster_parameter_group_name}"

  parameter {
    name         = "time_zone"
    value        = "Asia/Tokyo"
    apply_method = "immediate"
  }

  parameter {
    name         = "innodb_strict_mode"
    value        = "1"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_client"
    value        = "utf8"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_connection"
    value        = "utf8"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_database"
    value        = "utf8"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_filesystem"
    value        = "utf8"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_client"
    value        = "utf8"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_results"
    value        = "utf8"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_server"
    value        = "utf8"
    apply_method = "immediate"
  }

  parameter {
    name         = "collation_connection"
    value        = "utf8_general_ci"
    apply_method = "immediate"
  }

  parameter {
    name         = "collation_server"
    value        = "utf8_general_ci"
    apply_method = "immediate"
  }

  parameter {
    name         = "time_zone"
    value        = "Asia/Tokyo"
    apply_method = "immediate"
  }
}
