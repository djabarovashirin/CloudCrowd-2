resource "aws_autoscaling_group" "gogreen-app" {
  name                      = "gogreen_asg-app"
  max_size                  = 2
  min_size                  = 2
  health_check_grace_period = 350
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  vpc_zone_identifier       = [aws_subnet.private2.id, aws_subnet.private3.id]
  launch_template {
    id      = aws_launch_template.greenLT.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "gogreen-2" {
  alb_target_group_arn   = aws_lb_target_group.test-app.arn
  autoscaling_group_name = aws_autoscaling_group.gogreen-app.id
}