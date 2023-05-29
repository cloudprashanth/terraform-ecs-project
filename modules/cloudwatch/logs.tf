# Set up CloudWatch group and log stream and retain logs for 3 days
resource "aws_cloudwatch_log_group" "frontend_log_group" {
  name              = "/ecs/${var.frontend_service_name}"
  retention_in_days = 3

  tags = {
    Name = "/ecs/${local.project_name}-${local.env}-frontend"
  }
}
