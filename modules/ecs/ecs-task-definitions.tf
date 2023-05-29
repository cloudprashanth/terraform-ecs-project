resource "aws_ecs_task_definition" "frontend_td" {
  family                   = "${local.project_name}-${local.env}-frontend"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  container_definitions = jsonencode([
    {
      name      = "${local.project_name}-${local.env}-frontend"
      image     = "${var.account_id}.dkr.ecr.us-east-1.amazonaws.com/${local.project_name}-${local.env}-frontend:latest"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = var.frontend_log_group_name
          awslogs-region        = data.aws_region.current.name
          awslogs-stream-prefix = var.log_stream_prefix
        }
      }
    }
  ])
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }
  task_role_arn      = var.td_role_arn
  execution_role_arn = var.td_role_arn
}
