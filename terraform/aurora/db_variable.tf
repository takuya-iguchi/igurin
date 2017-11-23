############################
## Global
############################
variable "service" { default = "iguchi"}
variable "env"     { default = "dev"}

############################
## Private
############################
variable "parameter_group_name"    { default = "pg" }
variable "cluster_parameter_group_name"    { default = "cpg" }
variable "monitoring_name"    { default = "monitoring" }
variable "security_group_name"    { default = "sg" }

############################
## Incetance
############################
variable "instance_name"    { default = "db" }
variable "cluster_instance_count"  { default = "1" }
variable "cluster_instance_class"  { default = "db.t2.medium" }

############################
## Cluster
############################
variable "cluster_name"    { default = "db" }
variable "database_name"    { default = "iguchi" }
variable "username" { default = "iguchi" }
variable "password" { default = "iguchitakuya" }
variable "subnet_group_name"   { default = "default-vpc-b9d13cde" }
variable "storage_encrypted"   { default = "False" }