#################
# Security group
#################
variable "create" {
  description = "Whether to create security group and all rules"
  default     = 3
}

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  default     = ""
}

variable "name1" {
  description = "Name of security group"
  default     = ""
}

variable "name2" {
  description = "Name of security group"
  default     = ""
}

variable "name3" {
  description = "Name of security group"
  default     = ""
}

variable "description1" {
  description = "Description of security group"
  default     = ""
}

variable "description2" {
  description = "Description of security group"
  default     = ""
}

variable "description3" {
  description = "Description of security group"
  default     = ""
}

variable "tags" {
  description = "A mapping of tags to assign to security group"
  default     = {"Terraform" = "true"}
}

##########
# Ingress
##########
variable "ingress_with_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  default     = [
  {
    from_port   = 8080
    to_port     = 8090
    protocol    = "tcp"
    description = "User-service ports"
    cidr_blocks = "10.10.0.0/16"
  }
  ]
}

#########
# Egress
#########
variable "egress_rules" {
  description = "List of egress rules to create by name"
  default     = []
}

variable "egress_with_self" {
  description = "List of egress rules to create where 'self' is defined"
  default     = []
}

variable "egress_with_source_security_group_id" {
  description = "List of egress rules to create where 'source_security_group_id' is used"
  default     = []
}

variable "egress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all egress rules"
  default     = ["0.0.0.0/0"]
}

variable "egress_ipv6_cidr_blocks" {
  description = "List of IPv6 CIDR ranges to use on all egress rules"
  default     = ["::/0"]
}

variable "egress_prefix_list_ids" {
  description = "List of prefix list IDs (for allowing access to VPC endpoints) to use on all egress rules"
  default     = []
}
