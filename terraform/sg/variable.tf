#####################################
# ALL Settings
#####################################
variable "name" {
  description = "サービス名"
  default     = "test"
}

#####################################
# SG Group
#####################################
variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {"Terraform" = "true"}
}
