data "aws_route53_zone" "dns" {
  name         = "prashanthg.tk."
  private_zone = false
}
