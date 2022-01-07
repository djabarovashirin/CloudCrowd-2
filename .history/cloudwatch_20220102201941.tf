resource "aws_cloudwatch_log_group" "GoGreen" {
  name = "GoGreen"

  tags = {
    Environment = "test"
  }
}