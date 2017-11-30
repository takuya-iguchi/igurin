variable "cluster_parameters" {
  type        = "list"
  default     = [
    {
      name         = "time_zone"
      value        = "Asia/Tokyo"
      apply_method = "immediate"
    },
    {
      name         = "innodb_strict_mode"
      value        = "1"
      apply_method = "immediate"
    },
    {
      name         = "character_set_client"
      value        = "utf8"
      apply_method = "immediate"
    },
    {
      name         = "character_set_connection"
      value        = "utf8"
      apply_method = "immediate"
    },
    {
      name         = "character_set_database"
      value        = "utf8"
      apply_method = "immediate"
    },
    {
      name         = "character_set_filesystem"
      value        = "utf8"
      apply_method = "immediate"
    },
    {
      name         = "character_set_client"
      value        = "utf8"
      apply_method = "immediate"
    },
    {
      name         = "character_set_results"
      value        = "utf8"
      apply_method = "immediate"
    },
    {
      name         = "character_set_server"
      value        = "utf8"
      apply_method = "immediate"
    },
    {
      name         = "collation_connection"
      value        = "utf8_general_ci"
      apply_method = "immediate"
    },
    {
      name         = "collation_server"
      value        = "utf8_general_ci"
      apply_method = "immediate"
    },
    {
      name         = "time_zone"
      value        = "Asia/Tokyo"
      apply_method = "immediate"
    }
  ]
}
