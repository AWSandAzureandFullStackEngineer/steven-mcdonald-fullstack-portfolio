output "alb_security_group_id" {
  value = aws_security_group.alb_sg.id
}

output "ecs_security_group_id" {
  value = aws_security_group.ecs_sg.id
}

output "rds_security_group_id" {
  description = "The ID of the security group for the RDS instance."
  value       = aws_security_group.alb_sg
}

output "rds_security_group_id" {
  value = aws_security_group.rds_sg.id
}

