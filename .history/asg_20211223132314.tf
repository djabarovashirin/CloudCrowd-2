resource "aws_autoscaling_group" "gogreen" {
  name                      = "gogreen_asg"
  max_size                  = 12
  min_size                  = 8
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 8
  force_delete              = true
  launch_configuration      = aws_launch_configuration.as_conf.name
  vpc_zone_identifier       = [aws_subnet.private1.id, aws_subnet.private2.id]
}