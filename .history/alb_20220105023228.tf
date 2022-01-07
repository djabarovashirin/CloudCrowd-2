resource "aws_lb" "test" {
  name               = "test-lb-tf"
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
