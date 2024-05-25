variable "project_name" {
  description = "The project name"
}

variable "environment" {
  description = "The environment (e.g., production, staging)"
}

variable "domain_name" {
  description = "The domain name for the certificate"
}

variable "route53_zone_id" {
  description = "The Route 53 hosted zone ID"
}
