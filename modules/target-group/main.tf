resource "aws_lb_target_group" "target_group" {
  name        = "${var.project_name}-tg"
  protocol    = var.tg_protocol
  port        = var.tg_port
  target_type = var.tg_target_type
  vpc_id      = var.vpc_id

  health_check {
    path                = "/login"  
    interval            = 30  
    timeout             = 5  
    healthy_threshold   = 3  
    unhealthy_threshold = 3   
    matcher             = "200-399"  
  }
}