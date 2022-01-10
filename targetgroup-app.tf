resource "aws_lb_target_group" "test-app" {
  name        = "tf-app-lb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.test.id
  target_type = "instance"
  slow_start= 120
}
