#####################################
# ALL Settings
#####################################
variable "name" {
  description = "service name"
  default     = ""
}

#####################################
# VPC Settings
#####################################
variable "cidr" {
  description = "The CIDR block for the VPC"
  default     = ""
}

variable "enable_dns_hostnames" {
  description = "should be true if you want to use private DNS within the VPC"
  default     = false
}

variable "enable_dns_support" {
  description = "should be true if you want to use private DNS within the VPC"
  default     = false
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  default     = "default"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {"Terraform" = "true"}
}

#####################################
# Subnet Settings(共通)
#####################################
variable "azs" {
  description = "A list of Availability zones in the region"
  default     = []
}

#####################################
# Subnet Settings(Public)
#####################################
variable "public_subnets_name" {
  description = "A list of public subnets inside the Name."
  default     = []
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC."
  default     = []
}

variable "public_subnets_name_prd" {
  description = "A list of public subnets inside the Name."
  default     = []
}

variable "public_subnets_prd" {
  description = "A list of public subnets inside the VPC."
  default     = []
}

variable "public_subnets_name_stg" {
  description = "A list of public subnets inside the Name."
  default     = []
}

variable "public_subnets_stg" {
  description = "A list of public subnets inside the VPC."
  default     = []
}

variable "public_subnets_name_other" {
  description = "A list of public subnets inside the Name."
  default     = []
}

variable "public_subnets_other" {
  description = "A list of public subnets inside the VPC."
  default     = []
}

variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  default     = {"Terraform" = "true"}
}

variable "public_propagating_vgws" {
  description = "A list of VGWs the public route table should propagate."
  default     = []
}

variable "map_public_ip_on_launch" {
  description = "should be false if you do not want to auto-assign public IP on launch"
  default     = true
}

#####################################
# Subnet Settings(Private)
#####################################
variable "private_subnets_name_prd" {
  description = "A list of private subnets inside the Name."
  default     = []
}

variable "private_subnets_prd" {
  description = "A list of private subnets inside the VPC."
  default     = []
}

variable "private_subnets_name_stg" {
  description = "A list of private subnets inside the Name."
  default     = []
}

variable "private_subnets_stg" {
  description = "A list of private subnets inside the VPC."
  default     = []
}

variable "private_subnets_name_other" {
  description = "A list of private subnets inside the Name."
  default     = []
}

variable "private_subnets_other" {
  description = "A list of private subnets inside the VPC."
  default     = []
}

variable "private_subnet_tags" {
  description = "Additional tags for the public subnets"
  default     = {"Terraform" = "true"}
}

variable "private_propagating_vgws" {
  description = "A list of VGWs the private route table should propagate."
  default     = []
}


#####################################
# NatGateway Settings
#####################################
variable "enable_nat_gateway" {
  description = "should be true if you want to provision NAT Gateways for each of your private networks"
  default     = true
}

variable "single_nat_gateway" {
  description = "should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  default     = true
}

#####################################
# DBSubnet Settings
#####################################
variable "create_database_subnet_group_prd" {
  description = "Controls, if should database subnet group be created."
  default     = false
}

variable "create_database_subnet_group_stg" {
  description = "Controls, if should database subnet group be created."
  default     = false
}

#####################################
# elasticache Settings
#####################################
variable "create_elasticache_subnet_group_prd" {
  description = "Controls, if should database subnet group be created."
  default     = false
}

variable "create_elasticache_subnet_group_stg" {
  description = "Controls, if should database subnet group be created."
  default     = false
}
