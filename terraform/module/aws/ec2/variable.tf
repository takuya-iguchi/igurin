variable "name" {
  description = "Name to be used on all resources as prefix"
  default     = ""
}

variable "ami_id" {
  description = "ami_id to be used on all resources as prefix"
  default     = ""
}

variable "availability_zone" {
  description = "The AZ to start the instance in"
  default     = ""
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  default     = false
}

variable "instance_type" {
  description = "The type of instance to start"
  default     = ""
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  default     = false
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = "list"
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  default     = []
}

variable "iam_instance_profile" {
  description = "The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile."
  default     = ""
}

variable "tags" {
  description = "A mapping of tags to assign to security group"
  default     = {"Terraform" = "true"}
}

variable "root_block_device" {
  description = "Customize details about the root block device of the instance. See Block Devices below for details"
  default     = {}
}

variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  default     = []
}

variable "enable_eip" {
  description = ""
  default     = false
}
