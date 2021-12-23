resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.elb-sg.id]

  enable_deletion_protection = true

  tags = {
    Name = "gogreen"
  }
}