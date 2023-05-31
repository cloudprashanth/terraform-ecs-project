resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.dns.zone_id
  name    = "${local.env}.${data.aws_route53_zone.dns.name}"
  type    = "A"
  alias {
    name                   = var.elb_dns
    zone_id                = var.elb_zone_id
    evaluate_target_health = true
  }
}
