#################
# Security group
#################
variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  default     = ""
}

variable "name" {
  description = "ID of the VPC where to create security group"
  default     = ""
}

variable "description" {
  description = "ID of the VPC where to create security group"
  default     = ""
}

variable "tags" {
  description = "A mapping of tags to assign to security group"
  default     = {"Terraform" = "true"}
}

#################
# Security group
#################
variable "ingress_rules" {
  description = "ID of the VPC where to create security group"
  default     = []
}

variable "ingress_self_rules" {
  description = "ID of the VPC where to create security group"
  default     = []
}

variable "egress_rules" {
  description = "ID of the VPC where to create security group"
  default     = []
}
