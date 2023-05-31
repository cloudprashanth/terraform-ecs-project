resource "aws_lb" "lb" {
  name               = "${local.project_name}-${local.env}-elb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${var.web_sg}"]
  subnets            = var.public_subnets
}
