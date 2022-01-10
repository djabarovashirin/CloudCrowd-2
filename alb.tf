resource "aws_lb" "test" {
  name               = "GoGreenALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.elb-sg.id]

  subnet_mapping {
    subnet_id = aws_subnet.public1.id

  }

  subnet_mapping {
    subnet_id = aws_subnet.public2.id

  }

  tags = {
    Name = "GoGreenALB"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}
