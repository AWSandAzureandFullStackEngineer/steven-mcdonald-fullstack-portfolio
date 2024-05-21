output "bastion_security_group_id" {
  value = aws_security_group.bastion_security_group.id
}

output "app_server_security_group_id" {
  value = aws_security_group.app_server_security_group.id
}

output "database_security_group_id" {
  value = aws_security_group.database_security_group.id
}
