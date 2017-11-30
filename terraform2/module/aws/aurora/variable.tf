variable "service" { default = "iguchi"}
variable "env"     { default = "dev"}

variable "parameter_group_name"    { default = "pg" }
variable "cluster_parameter_group_name"    { default = "cpg" }
variable "monitoring_name"    { default = "monitoring" }
variable "security_group_name"    { default = "sg" }

variable "instance_name"    { default = "db" }
variable "cluster_instance_count"  { default = "1" }
variable "cluster_instance_class"  { default = "db.t2.medium" }

variable "cluster_name"    { default = "db" }
variable "database_name"    { default = "iguchi" }
variable "username" { default = "iguchi" }
variable "password" { default = "iguchitakuya" }
variable "subnet_group_name"   { default = "default-vpc-b9d13cde" }
variable "storage_encrypted"   { default = "False" }

variable "monitor_intarval" { default = "60"}
variable "port" { default = "3306"}
variable "backup" { default = "1"}
variable "backup_window" { default = "17:54-18:24"}
variable "mente_window" { default = "wed:01:00-wed:01:30"}

variable "parameter_group_description" {default = "test"}
