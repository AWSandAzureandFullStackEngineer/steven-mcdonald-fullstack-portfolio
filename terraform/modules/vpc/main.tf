resource "aws_vpc" "engineers-main-vpc" {
  cidr_block           = var.vpc_cider
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-${var.environment}-vpc"
  }
}

resource "aws_internet_gateway" "engineers-internet-gateway" {
  vpc_id = aws_vpc.engineers-main-vpc.id

  tags = {
    Name = "${var.project_name}-${var.environment}-internet-gateway"
  }
}

data "aws_availability_zones" "engineers-aws_availability_zones" {}

resource "aws_subnet" "engineers-public-subnet-az1" {
  vpc_id                  = aws_vpc.engineers-main-vpc.id
  cidr_block              = var.public_subnet-az1-cider
  availability_zone       = data.aws_availability_zones.engineers-aws_availability_zones.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-${var.environment}-public-subnet-az1"
  }
}

resource "aws_subnet" "engineers-public-subnet-az2" {
  vpc_id                  = aws_vpc.engineers-main-vpc.id
  cidr_block              = var.public_subnet-az2-cider
  availability_zone       = data.aws_availability_zones.engineers-aws_availability_zones.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-${var.environment}-public-subnet-az2"
  }
}

resource "aws_route_table" "engineers-public-route-table" {
  vpc_id = aws_vpc.engineers-main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.engineers-internet-gateway.id
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-public-route-table"
  }
}

resource "aws_route_table_association" "engineers-public-route-table-association-az1" {
  subnet_id      = aws_subnet.engineers-public-subnet-az1.id
  route_table_id = aws_route_table.engineers-public-route-table.id
}

resource "aws_route_table_association" "engineers-public-route-table-association-az2" {
  subnet_id      = aws_subnet.engineers-public-subnet-az2.id
  route_table_id = aws_route_table.engineers-public-route-table.id
}

resource "aws_subnet" "engineers-private-subnet-az1" {
  vpc_id                  = aws_vpc.engineers-main-vpc.id
  cidr_block              = var.private-app-subnet-az1-cider
  availability_zone       = data.aws_availability_zones.engineers-aws_availability_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-${var.environment}-private-subnet-az1"
  }
}

resource "aws_subnet" "engineers-private-subnet-az2" {
  vpc_id                  = aws_vpc.engineers-main-vpc.id
  cidr_block              = var.private-app-subnet-az2-cider
  availability_zone       = data.aws_availability_zones.engineers-aws_availability_zones.names[1]
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.project_name}-${var.environment}-private-subnet-az2"
  }
}

resource "aws_subnet" "engineers-data-private-subnet-az1" {
  vpc_id                  = aws_vpc.engineers-main-vpc.id
  cidr_block              = var.private-db-subnet-az1-cider
  availability_zone       = data.aws_availability_zones.engineers-aws_availability_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-${var.environment}-data-private-subnet-az1"
  }
}

resource "aws_subnet" "engineers-data-private-subnet-az2" {
  vpc_id                  = aws_vpc.engineers-main-vpc.id
  cidr_block              = var.private-db-subnet-az2-cider
  availability_zone       = data.aws_availability_zones.engineers-aws_availability_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-${var.environment}-data-private-subnet-az2"
  }
}
