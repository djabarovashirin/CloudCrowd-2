resource "aws_sns_topic" "CPU-SMS-EMAIL" {
  name = "CPU-NOTIFICATIONS"
}

resource "aws_sns_topic_subscription" "cpu-email" {
  topic_arn = aws_sns_topic.CPU-SMS-EMAIL.arn
  protocol  = "email"
  count = 2
  endpoint  = var.team-emails[count.index]
}
resource "aws_sns_topic_subscription" "cpu-sms" {
  topic_arn = aws_sns_topic.CPU-SMS-EMAIL.arn
  protocol  = "sms"
  endpoint  = var.team-phones[0]
}