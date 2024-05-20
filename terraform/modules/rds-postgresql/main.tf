resource "aws_db_instance" "postgresql" {
  allocated_storage      = var.allocated_storage
  engine                 = "postgres"
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = var.db_name
  username               = var.username
  password               = var.password
  parameter_group_name   = "default.postgres16"
  skip_final_snapshot    = true
  vpc_security_group_ids = [var.security_group_id]
  db_subnet_group_name   = var.subnet_group_name

  tags = {
    Name        = "${var.project_name}-${var.environment}-rds"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "${var.project_name}-${var.environment}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "${var.project_name}-${var.environment}-subnet-group"
    Environment = var.environment
    Project     = var.project_name
  }
}
