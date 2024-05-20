data "aws_iam_policy_document" "engineers_assume_role_policy" {
  statement {
    actions = [
      "sts:AssumeRole",
      "ecs:CreateCluster",
      "ecs:DeregisterContainerInstance",
      "ecs:DiscoverPollEndpoint",
      "ecs:Poll",
      "ecs:RegisterContainerInstance",
      "ecs:StartTelemetrySession",
      "ecs:UpdateContainerInstancesState",
      "ecs:Submit*",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
    resources = ["*"]
  }
}

resource "aws_iam_policy" "engineers_task_role_policy" {
  name   = "${var.project_name}-${var.environment}-ecs-task-role-policy"
  policy = data.aws_iam_policy_document.engineers_task_role_policy_document.json
}

resource "aws_iam_role" "engineers_ecs_task_role" {
  name               = "${var.project_name}-${var.environment}-ecs-task-role"
  assume_role_policy = data.aws_iam_policy_document.engineers_assume_role_policy.json
}


resource "aws_iam_role" "engineers_ecs_task_execution_role" {
  name               = "${var.project_name}-${var.environment}-ecs-task-execution-role"
  assume_role_policy = data.aws_iam_policy_document.engineers_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "engineers_task_role_policy_attachment" {
  role       = aws_iam_role.engineers_ecs_task_execution_role.name
  policy_arn = aws_iam_policy.engineers_task_role_policy.arn
}
