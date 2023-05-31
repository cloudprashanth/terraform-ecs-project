data "aws_acm_certificate" "amazon_issued" {
  domain      = "*.prashanthg.tk"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}
