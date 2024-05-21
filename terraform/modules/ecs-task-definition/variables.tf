variable "family" {}
variable "cpu_size" {}
variable "memory_size" {}
variable "container_name" {}
variable "image" {}
variable "container_port" {}
variable "environment_variables" {
  type    = list(object({
    name  = string
    value = string
  }))
  default = []
}
variable "execution_role_arn" {}
variable "task_role_arn" {}
