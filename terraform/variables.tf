variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" { default = "ap-northeast-1" }
variable "service" {}
variable "name"    {}
variable "env"     {}

variable "username" {}
variable "password" {}

variable "security_group_ids"  { type = "list" }
variable "subnet_group_name"   {}
variable "storage_encrypted"   {}

variable "cluster_instance_count"  {}
variable "cluster_instance_class"  {}
