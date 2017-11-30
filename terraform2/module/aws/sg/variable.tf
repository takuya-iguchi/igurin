#################
# Security group
#################
variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  default     = ""
}

variable "name_prd" {
  description = "Name of security group"
  default     = ""
}

variable "name_stg" {
  description = "Name of security group"
  default     = ""
}

variable "name_other" {
  description = "Name of security group"
  default     = ""
}

variable "description_prd" {
  description = "Description of security group"
  default     = ""
}

variable "description_stg" {
  description = "Description of security group"
  default     = ""
}

variable "description_other" {
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
variable "cidr_blocks_prd" {
  description = "List of ingress rules to create where 'cidr_blocks' is used"
  default     = []
}

variable "from_port_prd" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  default     = []
}

variable "to_port_prd" {
  description = "List of IPv6 CIDR ranges to use on all ingress rules"
  default     = []
}

variable "protocol_prd" {
  description = "List of prefix list IDs (for allowing access to VPC endpoints) to use on all ingress rules"
  default     = []
}

variable "cidr_blocks_stg" {
  description = "List of ingress rules to create where 'cidr_blocks' is used"
  default     = []
}

variable "from_port_stg" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  default     = []
}

variable "to_port_stg" {
  description = "List of IPv6 CIDR ranges to use on all ingress rules"
  default     = []
}

variable "protocol_stg" {
  description = "List of prefix list IDs (for allowing access to VPC endpoints) to use on all ingress rules"
  default     = []
}

variable "cidr_blocks_other" {
  description = "List of ingress rules to create where 'cidr_blocks' is used"
  default     = []
}

variable "from_port_other" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  default     = []
}

variable "to_port_other" {
  description = "List of IPv6 CIDR ranges to use on all ingress rules"
  default     = []
}

variable "protocol_other" {
  description = "List of prefix list IDs (for allowing access to VPC endpoints) to use on all ingress rules"
  default     = []
}
