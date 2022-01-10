resource "aws_lb" "test-2" {
  name               = "GoGreenALB-Private"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.elb-sg-private.id]

  subnet_mapping {
    subnet_id = aws_subnet.private2.id

  }

  subnet_mapping {
    subnet_id = aws_subnet.private3.id

  }

  tags = {
    Name = "GoGreenALB-Private"
  }
}

resource "aws_lb_listener" "app-tier" {
  load_balancer_arn = aws_lb.test-2.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test-app.arn
  }
}
