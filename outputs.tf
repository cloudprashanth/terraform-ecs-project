output "main_vpc_id" {
  description = "VPC ID"
  value       = module.vpc.main_vpc_id
}

output "public_subnets_list" {
  description = "List of Public Subnets"
  value       = module.vpc.public_subnets
}

output "ecs_td_policy" {
  value     = module.iam.td_policy_arn
  sensitive = true
}

output "account_id" {
  value = module.iam.account_id
}

# output "private_subnets_list" {
#   description = "List of Private Subnets"
#   value       = module.vpc.private_subnets
# }

# output "nat_ip" {
#   description = "IP address of the NAT gateway"
#   value       = module.vpc.nat_ip
# }

output "frontend_log_group_name" {
  description = "Frontend Log group name"
  value       = module.cloudwatch.frontend_log_group_name.id
}
