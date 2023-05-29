output "frontend_service_id" {
  value = aws_ecs_service.frontend_service.id
}

output "frontend_td_name" {
  value = aws_ecs_task_definition.frontend_td.family
}

output "region_name" {
  value = data.aws_region.current.name
}
