resource "aws_ecs_service" "service" {
  name            = var.service_name
  cluster         = var.cluster_id
  task_definition = var.task_definition_arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.subnets
    security_groups  = var.security_groups
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  depends_on = [aws_lb_target_group_attachment.service]
}

resource "aws_lb_target_group_attachment" "service" {
  target_group_arn = var.target_group_arn
  target_id        = aws_ecs_service.service.id
  port             = var.container_port
}
