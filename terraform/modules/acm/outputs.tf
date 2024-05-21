output "certificate_arn" {
  value = aws_acm_certificate.acm_certificate.arn
}

output "domain_name" {
  value = var.domain_name
}
