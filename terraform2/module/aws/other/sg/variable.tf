#################
# Security group
#################
variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  default     = ""
}

variable "name" {
  description = "Name of security group"
  default     = []
}

variable "description" {
  description = "Description of security group"
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to security group"
  default     = {"Terraform" = "true"}
}

##########
# Ingress
##########
variable "cidr_blocks" {
  description = "List of ingress rules to create where 'cidr_blocks' is used"
  default     = []
}

variable "from_port" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  default     = []
}

variable "to_port" {
  description = "List of IPv6 CIDR ranges to use on all ingress rules"
  default     = []
}

variable "protocol" {
  description = "List of prefix list IDs (for allowing access to VPC endpoints) to use on all ingress rules"
  default     = []
}

variable "egress_cidr_blocks" {
  description = "List of ingress rules to create where 'cidr_blocks' is used"
  default     = []
}

variable "egress_from_port" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  default     = []
}

variable "egress_to_port" {
  description = "List of IPv6 CIDR ranges to use on all ingress rules"
  default     = []
}

variable "egress_protocol" {
  description = "List of prefix list IDs (for allowing access to VPC endpoints) to use on all ingress rules"
  default     = []
}
