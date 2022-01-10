resource "aws_lb_target_group" "test" {
  name        = "tf-example-lb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.test.id
  target_type = "instance"
  slow_start= 120

  health_check { 
  interval = 120
  healthy_threshold = 10
  timeout = 119
  }
}

