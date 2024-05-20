variable "project_name" {}
variable "environment" {}
variable "vpc_id" {}
variable "allowed_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
