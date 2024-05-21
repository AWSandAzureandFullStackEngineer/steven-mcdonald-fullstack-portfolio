variable "region" {}
variable "project_name" {}
variable "environment" {}

variable "vpc_cider" {}
variable "public_subnet-az1-cider" {}
variable "public_subnet-az2-cider" {}
variable "private-app-subnet-az1-cider" {}
variable "private-app-subnet-az2-cider" {}
variable "private-db-subnet-az1-cider" {}
variable "private-db-subnet-az2-cider" {}

# ECS

variable "cluster_name" {}

# ECS TASK
variable "family" {}
variable "cpu_size" {}
variable "memory_size" {}
variable "container_name" {}
variable "image" {}
variable "container_port" {}

# ECS SERVICE
variable "service_name" {}

# RDS POSTGRESQL
variable "engine_version" {}
variable "instance_class" {}
variable "db_name" {}
variable "username" {}
variable "password" {}

variable "domain_name" {}
variable "alternative_names" {}
variable "target_type" {}
variable "zone_id" {}
