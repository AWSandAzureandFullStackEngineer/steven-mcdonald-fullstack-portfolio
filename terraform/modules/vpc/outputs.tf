output "region" {
  value = var.region
}

output "name" {
  value = var.project_name
}

output "environment" {
  value = var.environment
}

output "vpc_id" {
  value = aws_vpc.engineers-main-vpc.id
}

output "aws_internet_gateway" {
  value = aws_internet_gateway.engineers-internet-gateway
}

output "aws_internet_gateway_id" {
  value = aws_internet_gateway.engineers-internet-gateway.id
}

output "public_subnet-az1_id" {
  value = aws_subnet.engineers-public-subnet-az1.id
}

output "public_subnet-az2_id" {
  value = aws_subnet.engineers-public-subnet-az2.id
}

output "private-app-subnet-az1_id" {
  value = aws_subnet.engineers-private-subnet-az1.id
}

output "private-app-subnet-az2_id" {
  value = aws_subnet.engineers-private-subnet-az2.id
}

output "private-db-subnet-az1_id" {
  value = aws_subnet.engineers-data-private-subnet-az1.id
}

output "private-db-subnet-az2_id" {
  value = aws_subnet.engineers-data-private-subnet-az2.id
}

output "aws_availability_zones_1" {
  value = data.aws_availability_zones.engineers-aws_availability_zones.names[0]
}

output "aws_availability_zones_2" {
  value = data.aws_availability_zones.engineers-aws_availability_zones.names[1]
}
