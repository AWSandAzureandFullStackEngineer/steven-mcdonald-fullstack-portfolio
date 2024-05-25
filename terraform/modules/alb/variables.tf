variable "project_name" {
  description = "The project name"
  type        = string
}

variable "environment" {
  description = "The environment (e.g., production, staging)"
  type        = string
}

variable "alb_security_group_id" {
  description = "The security group ID for the ALB"
  type        = string
}

variable "public_subnet_az1_id" {
  description = "The first public subnet ID"
  type        = string
}

variable "public_subnet_az2_id" {
  description = "The second public subnet ID"
  type        = string
}

variable "target_type" {
  description = "The target type for the ALB target group"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "certificate_arn" {
  description = "The ARN of the ACM certificate"
  type        = string
}
