variable "cluster_name_prd"    { default = "" }
variable "database_name_prd"    { default = "" }
variable "username_prd" { default = "" }
variable "password_prd" { default = "" }
variable "backup_prd" { default = ""}
variable "backup_window_prd" { default = ""}
variable "mente_window_prd" { default = ""}
variable "port_prd" { default = ""}
variable "security_group_id_prd" {default = ""}
variable "subnet_group_name_prd" {default = ""}
variable "storage_encrypted_prd"   { default = "" }

variable "instance_name_prd"    { default = "" }
variable "cluster_instance_count_prd"  { default = "" }
variable "cluster_instance_class_prd"  { default = "" }
variable "monitor_intarval_prd" { default = ""}

variable "parameter_group_name_prd"    { default = "" }
variable "parameter_group_description_prd" {default = ""}

variable "cluster_parameter_group_name_prd" { default = ""}
variable "cluster_parameter_description_prd"    { default = "" }

variable "monitoring_role_name"    { default = "monitoring" }


variable "cluster_name_stg"    { default = "" }
variable "database_name_stg"    { default = "" }
variable "username_stg" { default = "" }
variable "password_stg" { default = "" }
variable "backup_stg" { default = ""}
variable "backup_window_stg" { default = ""}
variable "mente_window_stg" { default = ""}
variable "port_stg" { default = ""}
variable "security_group_id_stg" {default = ""}
variable "subnet_group_name_stg" {default = ""}
variable "storage_encrypted_stg"   { default = "" }

variable "instance_name_stg"    { default = "" }
variable "cluster_instance_count_stg"  { default = "" }
variable "cluster_instance_class_stg"  { default = "" }
variable "monitor_intarval_stg" { default = ""}

variable "parameter_group_name_stg"    { default = "" }
variable "parameter_group_description_stg" {default = ""}

variable "cluster_parameter_group_name_stg" { default = ""}
variable "cluster_parameter_description_stg"    { default = "" }
