resource "aws_ecs_task_definition" "task" {
  family                   = var.family
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu_size
  memory                   = var.memory_size

  container_definitions = jsonencode([
    {
      name      = var.container_name
      image     = var.image
      cpu       = var.cpu_size
      memory    = var.memory_size
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp"
        }
      ]
      environment = var.environment_variables
    }
  ])

  execution_role_arn = var.execution_role_arn
  task_role_arn      = var.task_role_arn
}
