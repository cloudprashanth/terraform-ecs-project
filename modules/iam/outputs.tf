output "td_policy_arn" {
  value = "${aws_iam_policy.ecs_td_policy.arn}"
}

output "td_role_arn" {
  value = "${aws_iam_role.ecs_td_role.arn}"
}