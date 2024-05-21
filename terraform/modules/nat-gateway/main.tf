resource "aws_eip" "engineers-eip1" {

  tags = {
    Name = "${var.project_name}-${var.environment}-eip1"
  }
}

resource "aws_eip" "engineers-eip2" {
  tags = {
    Name = "${var.project_name}-${var.environment}-eip2"
  }
}

resource "aws_nat_gateway" "engineers-nat-az1" {
  allocation_id = aws_eip.engineers-eip1.id
  subnet_id     = var.public_subnet-az1_id

  tags = {
    Name = "${var.project_name}-${var.environment}-nat-az1"
  }

  depends_on = [var.engineers-internet-gateway]
}

resource "aws_nat_gateway" "engineers-nat-az2" {
  allocation_id = aws_eip.engineers-eip2.id
  subnet_id     = var.public_subnet-az2_id

  tags = {
    Name = "${var.project_name}-${var.environment}-nat-az2"
  }

  depends_on = [var.engineers-internet-gateway]
}

resource "aws_route_table" "engineers-private-route-table-az1" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.engineers-nat-az1.id
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-private-route-table-az1"
  }
}

resource "aws_route_table_association" "engineers-app-private-route-table-association-az1" {
  subnet_id      = var.private-app-subnet-az1_id
  route_table_id = aws_route_table.engineers-private-route-table-az1.id
}

resource "aws_route_table_association" "engineers-db-private-route-table-association-az1" {
  subnet_id      = var.private-db-subnet-az1_id
  route_table_id = aws_route_table.engineers-private-route-table-az1.id
}

resource "aws_route_table" "engineers-private-route-table-az2" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.engineers-nat-az2.id
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-private-route-table-az2"
  }
}

resource "aws_route_table_association" "engineers-app-private-route-table-association-az2" {
  subnet_id      = var.private-app-subnet-az2_id
  route_table_id = aws_route_table.engineers-private-route-table-az2.id
}

resource "aws_route_table_association" "engineers-db-private-route-table-association-az2" {
  subnet_id      = var.private-db-subnet-az2_id
  route_table_id = aws_route_table.engineers-private-route-table-az2.id
}
