#####################################
# All Directory Read
#####################################
variable "vpc_id" {
  description = "VPC ID"
  default     = ""
}

variable "igw_id" {
  description = "Internet Gateways ID"
  default     = ""
}

#####################################
# ALL Settings
#####################################
variable "name" {
  description = "service name"
  default     = ""
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

variable "public_route_table_name" {
  description = "Public RouteTable Name."
  default     = ""
}

variable "public_subnets" {
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
variable "private_subnets_name" {
  description = "A list of private subnets inside the Name."
  default     = []
}

variable "private_route_table_name" {
  description = "Private RouteTable Name."
  default     = []
}

variable "private_subnets" {
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
  default     = false
}

#####################################
# DBSubnet Settings
#####################################
variable "db_subnet_gourp_name" {
  description = "DB Subnet Gourp Name."
  default     = "defaultvpc"
}

variable "db_subnet_gourp_description" {
  description = "DB Subnet Gourp Description Name."
  default     = "defaultvpc"
}

variable "create_database_subnet_group" {
  description = "Controls, if should database subnet group be created."
  default     = false
}

#####################################
# elasticache Settings
#####################################
variable "elasticache_subnet_gourp_name" {
  description = "Elasticache Subnet Gourp Name."
  default     = "defaultvpc"
}

variable "elasticache_subnet_gourp_description" {
  description = "Elasticache Subnet Gourp Description Name."
  default     = "defaultvpc"
}

variable "create_elasticache_subnet_group" {
  description = "Controls, if should database subnet group be created."
  default     = false
}
