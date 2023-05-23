resource "aws_ecs_service" "frontend_service" {
  name            = "${local.project_name}-${local.env}-frontend"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.frontend_td.arn
  desired_count   = 1
  launch_type = "FARGATE"
  network_configuration {
    subnets = var.public_subnets
    security_groups = ["${var.web_sg}"]
    assign_public_ip = true
  }
  load_balancer {
    target_group_arn = var.frontend_tg
    container_name = aws_ecs_task_definition.frontend_td.family
    container_port = var.frontend_port
  }
}

# resource "aws_lb_target_group_attachment" "frontend_tg_attachment" {
#   target_group_arn = var.frontend_tg
#   target_id = aws_ecs_service.frontend_service.id
#   port = 80
# }