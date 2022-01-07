resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.test.id
  target_type = "instance"
}

resource "aws_autoscaling_attachment" "gogreen" {
 alb_target_group_arn = aws_lb_target_group.test.arn
 autoscaling_group_name = aws_autoscaling_group.gogreen.id
}