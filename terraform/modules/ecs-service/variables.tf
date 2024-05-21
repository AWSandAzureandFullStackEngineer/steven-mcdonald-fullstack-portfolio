variable "service_name" {}
variable "cluster_id" {}
variable "task_definition_arn" {}
variable "desired_count" {}
variable "subnets" {
  type = list(string)
}
variable "security_groups" {
  type = list(string)
}
variable "assign_public_ip" {}
variable "target_group_arn" {}
variable "container_name" {}
variable "container_port" {}
