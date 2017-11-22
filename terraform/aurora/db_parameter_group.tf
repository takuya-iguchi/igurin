############################
## parameter_group
############################

resource "aws_db_parameter_group" "default" {
  name    = "${var.service}-${var.env}-${var.parameter_group_name}"
  family  = "aurora5.6"
  description = "${var.parameter_group_name}"

  parameter {
    name         = "log_output"
    value        = "FILE"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "performance_schema"
    value        = "1"
    apply_method = "pending-reboot"
  }
}
