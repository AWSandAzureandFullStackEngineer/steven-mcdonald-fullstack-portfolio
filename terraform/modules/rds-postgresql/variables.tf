variable "project_name" {}
variable "environment" {}
variable "allocated_storage" {
  default = 20
}
variable "engine_version" {
  default = "16.2"
}
variable "instance_class" {
  default = "db.t3.micro"
}
variable "db_name" {}
variable "username" {}
variable "password" {}
variable "security_group_id" {}
variable "subnet_group_name" {}
variable "subnet_ids" {
  type = list(string)
}
