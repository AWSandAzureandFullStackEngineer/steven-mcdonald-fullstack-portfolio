output "vpc_id" {
  value = aws_vpc.engineers_main_vpc.id
}

output "public_subnet_az1_id" {
  value = aws_subnet.engineers_public_subnet_az1.id
}

output "public_subnet_az2_id" {
  value = aws_subnet.engineers_public_subnet_az2.id
}

output "private_app_subnet_az1_id" {
  value = aws_subnet.engineers_private_subnet_az1.id
}

output "private_app_subnet_az2_id" {
  value = aws_subnet.engineers_private_subnet_az2.id
}

output "private_db_subnet_az1_id" {
  value = aws_subnet.engineers_data_private_subnet_az1.id
}

output "private_db_subnet_az2_id" {
  value = aws_subnet.engineers_data_private_subnet_az2.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.engineers_internet_gateway.id
}
