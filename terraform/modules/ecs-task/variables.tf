variable "family" {}
variable "cpu" {}
variable "memory" {}
variable "container_name" {}
variable "image" {}
variable "container_port" {}
variable "environment" {
  type = list(object({
    name  = string
    value = string
  }))
}
variable "execution_role_arn" {}
variable "task_role_arn" {}
