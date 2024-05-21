resource "aws_vpc" "engineers_main_vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-${var.environment}-vpc"
  }
}

resource "aws_internet_gateway" "engineers_internet_gateway" {
  vpc_id = aws_vpc.engineers_main_vpc.id

  tags = {
    Name = "${var.project_name}-${var.environment}-internet-gateway"
  }
}

resource "aws_subnet" "engineers_public_subnet_az1" {
  vpc_id                  = aws_vpc.engineers_main_vpc.id
  cidr_block              = var.public_subnet_az1_cidr
  availability_zone       = data.aws_availability_zones.engineers_aws_availability_zones.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-${var.environment}-public-subnet-az1"
  }
}

resource "aws_subnet" "engineers_public_subnet_az2" {
  vpc_id                  = aws_vpc.engineers_main_vpc.id
  cidr_block              = var.public_subnet_az2_cidr
  availability_zone       = data.aws_availability_zones.engineers_aws_availability_zones.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-${var.environment}-public-subnet-az2"
  }
}

resource "aws_route_table" "engineers_public_route_table" {
  vpc_id = aws_vpc.engineers_main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.engineers_internet_gateway.id
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-public-route-table"
  }
}

resource "aws_route_table_association" "engineers_public_route_table_association_az1" {
  subnet_id      = aws_subnet.engineers_public_subnet_az1.id
  route_table_id = aws_route_table.engineers_public_route_table.id
}

resource "aws_route_table_association" "engineers_public_route_table_association_az2" {
  subnet_id      = aws_subnet.engineers_public_subnet_az2.id
  route_table_id = aws_route_table.engineers_public_route_table.id
}

resource "aws_subnet" "engineers_private_subnet_az1" {
  vpc_id                  = aws_vpc.engineers_main_vpc.id
  cidr_block              = var.private_app_subnet_az1_cidr
  availability_zone       = data.aws_availability_zones.engineers_aws_availability_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-${var.environment}-private-subnet-az1"
  }
}

resource "aws_subnet" "engineers_private_subnet_az2" {
  vpc_id                  = aws_vpc.engineers_main_vpc.id
  cidr_block              = var.private_app_subnet_az2_cidr
  availability_zone       = data.aws_availability_zones.engineers_aws_availability_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-${var.environment}-private-subnet-az2"
  }
}

resource "aws_subnet" "engineers_data_private_subnet_az1" {
  vpc_id                  = aws_vpc.engineers_main_vpc.id
  cidr_block              = var.private_db_subnet_az1_cidr
  availability_zone       = data.aws_availability_zones.engineers_aws_availability_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-${var.environment}-data-private-subnet-az1"
  }
}

resource "aws_subnet" "engineers_data_private_subnet_az2" {
  vpc_id                  = aws_vpc.engineers_main_vpc.id
  cidr_block              = var.private_db_subnet_az2_cidr
  availability_zone       = data.aws_availability_zones.engineers_aws_availability_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-${var.environment}-data-private-subnet-az2"
  }
}

data "aws_availability_zones" "engineers_aws_availability_zones" {}
