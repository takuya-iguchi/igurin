module "aurora" {
  source = "../../module/aws/other/aurora"

  monitoring_role_name = "rds-monitoring-role"

  cluster_name  = "sakura"
  database_name = "sakura"
  username      = "sakura"
  password      = "sakurasakura"
  backup        = "1"
  backup_window = "17:54-18:24"
  mente_window  = "wed:01:00-wed:01:30"
  port          = "3306"
  security_group_id = "${module.sg.sg_id}"
  subnet_group_name = "${module.vpc.db_subnet_id}"
  storage_encrypted = "False"

  instance_name = "db"
  cluster_instance_count = "1"
  cluster_instance_class = "db.t2.small"
  monitor_intarval = "60"

  parameter_group_name = "pg"
  parameter_group_description = "test"

  cluster_parameter_group_name = "cpg"
  cluster_parameter_description = "test"

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
    }
    ]
}
