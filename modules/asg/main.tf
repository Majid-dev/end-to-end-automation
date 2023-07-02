
resource "aws_autoscaling_group" "demo_asg" {
  name = "${var.project_name}-asg"
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size

  target_group_arns = [var.target_group_arn]
  vpc_zone_identifier  = var.subnet_ids

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }
}
