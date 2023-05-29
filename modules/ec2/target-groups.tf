#Create target group for web service with IP as target type
resource "aws_lb_target_group" "web_tg" {
  name        = "${local.project_name}-${local.env}-web-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.main_vpc
  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = var.health_check_path
    unhealthy_threshold = "2"
  }
}

#Create HTTP Listener for Load Balancer
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
    type = "redirect"
  }
}

#Create HTTPS Listener for Load Balancer
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = data.aws_acm_certificate.amazon_issued.arn
  default_action {
    target_group_arn = aws_lb_target_group.web_tg.arn
    type             = "forward"
  }
}
