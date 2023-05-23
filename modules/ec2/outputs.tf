output "web_tg_arn" {
  value = "${aws_lb_target_group.web_tg.arn}"
}

output "elb_name" {
  value = "${aws_lb.lb.dns_name}"
}

output "elb_zone_id" {
  value = aws_lb.lb.zone_id
}