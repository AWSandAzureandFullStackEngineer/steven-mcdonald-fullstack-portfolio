variable "project_name" {}
variable "environment" {}
variable "subnets" {
  type = list(string)
}
variable "security_groups" {
  type = list(string)
}
variable "vpc_id" {}
