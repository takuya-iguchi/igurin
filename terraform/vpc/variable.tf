#####################################
# ALL Settings
#####################################
variable "name" {
  description = "サービス名"
  default     = "test"
}

#####################################
# VPC Settings
#####################################
variable "cidr" {
  description = "The CIDR block for the VPC"
  default     = "172.20.0.0/16"
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
  default     = ["ap-northeast-1a","ap-northeast-1c"]
}

#####################################
# Subnet Settings(Public)
#####################################
variable "public_subnets" {
  description = "A list of public subnets inside the VPC."
  default     = ["172.20.10.0/24", "172.20.11.0/24"]
}

variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  default     = {"Terraform" = "true"
                 "Netowork" =  "Public"}
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
variable "private_subnets" {
  description = "A list of private subnets inside the VPC."
  default     = ["172.20.100.0/24", "172.20.101.0/24", "172.20.110.0/24", "172.20.110.0/24", "172.20.120.0/24"]
}

variable "private_subnet_tags" {
  description = "Additional tags for the public subnets"
  default     = {"Terraform" = "true"
                 "Netowork" = "Private"}
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
  default     = false
}

variable "single_nat_gateway" {
  description = "should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  default     = false
}
