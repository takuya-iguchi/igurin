module "aurora" {
  source = "../../module/aws/aurora"

  monitoring_role_name = "rds-monitoring-role"

  cluster_name  = "aurora-cl-01"
  database_name = ""
  username      = ""
  password      = ""
  backup        = "1"
  backup_window = "02:00-4:00"
  mente_window  = "wed:01:00-wed:01:30"
  port          = "3306"
  security_group_id = ["${module.sg_default.sg_id}", "${module.sg_aurora.sg_id}"]
  storage_encrypted = "False"

  db_subnet_gourp_name        = ""
  db_subnet_gourp_description = ""
  db_subnet_group_subnet_ids  = "${module.vpc.private_subnets}"
  instance_name = "-aurora-cl-01-01"
  cluster_instance_count = "1"
  cluster_instance_class = "db.t2.small"
  monitor_intarval = "60"

  parameter_group_name = "-aurora-t2small"
  parameter_group_description = "for t2small"

  cluster_parameter_group_name = "-aurora-cl-t2small"
  cluster_parameter_description = "for t2small"

  final_snapshot_name = "final"

  cluster_parameters = [{
      name         = "time_zone"
      value        = "Asia/Tokyo"
      apply_method = "immediate"
    },
    {
      name         = "innodb_strict_mode"
      value        = "1"
      apply_method = "immediate"
    }]

  db_parameters = [
    {
      name         = "log_output"
      value        = "FILE"
      apply_method = "pending-reboot"
    },
    {
      name         = "general_log"
      value        = "1"
      apply_method = "pending-reboot"
    },
    {
      name         = "innodb_lock_wait_timeout"
      value        = "5"
      apply_method = "pending-reboot"
    },
    {
      name         = "log_queries_not_using_indexes"
      value        = "1"
      apply_method = "pending-reboot"
    },
    {
      name         = "long_query_time"
      value        = "1"
      apply_method = "pending-reboot"
    },
    {
      name         = "performance_schema"
      value        = "1"
      apply_method = "pending-reboot"
    },
    {
      name         = "slow_query_log"
      value        = "1"
      apply_method = "pending-reboot"
    },
    {
      name         = "sql_mode"
      value        = "ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"
      apply_method = "pending-reboot"
    }
    ]
}
