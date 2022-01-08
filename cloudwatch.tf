resource "aws_cloudwatch_metric_alarm" "CPU-alarm" {
  alarm_name          = "CPU ALARM"
  alarm_description   = "CPU ALARM ABOVE 75%"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "75"
  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.gogreen.name
  }
  actions_enabled = true
  alarm_actions   = [aws_sns_topic.CPU-SMS-EMAIL.arn]
}