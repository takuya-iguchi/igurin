variable "db_parameters" {
  type        = "list"
  default     = [
    {
      name         = "log_output"
      value        = "FILE"
      apply_method = "pending-reboot"
    },
    {
      name         = "performance_schema"
      value        = "1"
      apply_method = "pending-reboot"
    }
  ]
}
