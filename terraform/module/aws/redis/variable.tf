variable "apply_immediately" {
  description = "Specifies whether any modifications are applied immediately, or during the next maintenance window. Default is false."
  default     = "false"
}

variable "redis_name" {
  description = "Name for the Redis replication group i.e. UserObject"
  default = ""
}

variable "redis_description" {
  description = "Name for the Redis replication group i.e. UserObject"
  default = ""
}

variable "redis_clusters" {
  description = "Number of Redis cache clusters (nodes) to create"
  default = ""
}

variable "redis_failover" {
  default = false
}

variable "redis_node_type" {
  description = "Instance type to use for creating the Redis cache clusters"
  default     = ""
}

variable "redis_port" { default = 6379 }

variable "subnet_group" {
  description = "List of VPC Subnet IDs for the cache subnet group"
  default     = ""
}

variable "redis_version" {
  description = "Redis version to use, defaults to 3.2.4"
  default = ""
}

variable "sg_id" {
  description = "Security Group ID"
  default = ""
}

variable "parameter_group_name" {
  description = "Elasticache Parameters Group Name"
  default = ""
}

variable "parameter_group_description" {
  description = "Elasticache Parameters Group Description Name"
  default = ""
}

variable "elasticache_parameters" {
  description = "Elasticache Parameters Group Name"
  default = []
}
