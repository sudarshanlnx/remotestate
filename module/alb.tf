resource "aws_lb" "application_lb" {
  name               = var.lb_name
  internal           = var.lb_internal
  load_balancer_type = "application"
  security_groups    = [aws_security_group.global-sg-2025.id]
  subnets            = var.lb_subnets

  tags = {
    Name = var.lb_name
  }
}

resource "aws_lb_target_group" "web_target_group" {
  name     = var.target_group_name
  port     = var.target_port
  protocol = var.target_protocol
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200"
    path                = var.health_check_path
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.application_lb.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_target_group.arn
  }
}

resource "aws_lb_target_group_attachment" "webserver_attachment" {
  target_group_arn = aws_lb_target_group.web_target_group.arn
  target_id        = aws_instance.webserver.id
  port             = var.target_port
}
