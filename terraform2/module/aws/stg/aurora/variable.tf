variable "cluster_name"    { default = "" }
variable "database_name"    { default = "" }
variable "username" { default = "" }
variable "password" { default = "" }
variable "backup" { default = ""}
variable "backup_window" { default = ""}
variable "mente_window" { default = ""}
variable "port" { default = ""}
variable "security_group_id" {default = ""}
variable "subnet_group_name" {default = ""}
variable "storage_encrypted"   { default = "" }

variable "instance_name"    { default = "" }
variable "cluster_instance_count"  { default = "" }
variable "cluster_instance_class"  { default = "" }
variable "monitor_intarval" { default = ""}

variable "parameter_group_name"    { default = "" }
variable "parameter_group_description" {default = ""}

variable "cluster_parameter_group_name" { default = ""}
variable "cluster_parameter_description"    { default = "" }

variable "monitoring_role_name"    { default = "" }
