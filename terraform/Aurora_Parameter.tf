############################
## Variables
############################

#variable "service" { description = "takuya" }
#variable "name"    { description = "iguchi" }
#variable "env"     { description = "dev" }

############################
## Parameter
############################

resource "aws_db_parameter_group" "default" {
  name   = "test"
  family = "aurora5.6"

  tags {
    Name    = "test"
  }
}

resource "aws_rds_cluster_parameter_group" "default" {
  name        = "test"
  family      = "aurora5.6"
  description = "test1"

  tags {
    Name    = "test"
  }

  parameter {
    name         = "character_set_client"
    value        = "utf8mb4"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_connection"
    value        = "utf8mb4"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_database"
    value        = "utf8mb4"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_filesystem"
    value        = "utf8mb4"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_results"
    value        = "utf8mb4"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_server"
    value        = "utf8mb4"
    apply_method = "immediate"
  }

  parameter {
    name         = "collation_connection"
    value        = "utf8mb4_general_ci"
    apply_method = "immediate"
  }

  parameter {
    name         = "collation_server"
    value        = "utf8mb4_general_ci"
    apply_method = "immediate"
  }

  parameter {
    name         = "time_zone"
    value        = "Asia/Tokyo"
    apply_method = "immediate"
  }
}
