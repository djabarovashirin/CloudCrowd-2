resource "aws_autoscaling_group" "gogreen" {
  name                      = "gogreen_asg"
  max_size                  = 2
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  vpc_zone_identifier       = [aws_subnet.private1.id, aws_subnet.private3.id]
  launch_template {
    id = aws_launch_template.greenLT.id
    version= "$Latest"
  }
}

resource "aws_autoscaling_attachment" "gogreen" {
  alb_target_group_arn   = aws_lb_target_group.test.arn
  autoscaling_group_name = aws_autoscaling_group.gogreen.id
}