resource "aws_sns_topic" "CPU-SMS-EMAIL" {
  name = "CPU-NOTIFICATIONS"
}

resource "aws_sns_topic_subscription" "cpu-email" {
  topic_arn = aws_sns_topic.CPU-SMS-EMAIL.arn
  protocol  = "email"
  endpoint  = file("./emails.txt")
}
resource "aws_sns_topic_subscription" "cpu-sms" {
  topic_arn = aws_sns_topic.CPU-SMS-EMAIL.arn
  protocol  = "sms"
  endpoint  = file("./phones.txt")
}