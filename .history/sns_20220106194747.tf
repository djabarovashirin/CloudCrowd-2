resource "aws_sns_topic" "email" {
  name = "gogreen-scale-up-email"
}

resource "aws_sns_topic_subscription" "email-sub" {
  topic_arn = aws_sns_topic.email.arn
  protocol  = "email"
  endpoint  = "durmazfa@gmail.com"
}

# cloudwatch alarm for scaling up need, triggers sns topic that triggers sns subscription to send an SMS

resource "aws_cloudwatch_metric_alarm" "email-alarm" {
  alarm_name          = "app-tier-cpu-alarm-to-send-email-to ....."
  alarm_description   = "app-tier-scaleup-cpu-alarm"
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
  alarm_actions   = [aws_sns_topic.email.arn]
}

# resource "aws_sns_topic" "scale-down-email" {
#   name = "gogreen-scale-up-email"
# }

# resource "aws_sns_topic_subscription" "frontend-send_email2" {
#   topic_arn = aws_sns_topic.scale-down-email.arn
#   protocol  = "email"
#   endpoint  = var.alarms_email
# }