resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.cluster_name

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}