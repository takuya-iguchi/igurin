module "aurora" {
  source = "../../module/aws/aurora"

  monitoring_role_name = "Monitoring"
  monitor_intarval = "0"

  cluster_name  = "dev-aurora-cl-01"
  database_name = "dev"
  username      = "root"
  password      = "Zw6fBjcP"
  backup        = "1"
  backup_window = "03:00-04:00"
  mente_window  = "wed:01:00-wed:01:30"
  port          = "3306"

  db_subnet_gourp_name        = "dev"
  db_subnet_gourp_description = "dev"
  db_subnet_group_subnet_ids  = "${module.vpc.private_subnets}"

  security_group_id = ["${module.sg_default.sg_id}", "${module.sg_aurora.sg_id}"]
  storage_encrypted = "False"

  instance_name = "dev-aurora-cl-01-01"
  cluster_instance_count = "1"
  cluster_instance_class = "db.t2.small"

  parameter_group_name = "dev-aurora-t2small"
  parameter_group_description = "for t2small"

  cluster_parameter_group_name = "dev-aurora-cl-t2small"
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
