resource "aws_instance" "app" {
  ami                  = var.ami
  instance_type        = var.instance_type
  count                = 4
  security_groups      = ["${aws_security_group.app-sg.id}"]
  subnet_id            = "aws_subnet.private2.id"
  availability_zone    = "us-west-1a"
  iam_instance_profile = aws_iam_instance_profile.s3_profile.name
  tags = {
    Name = "app-tier1"
  }
}

resource "aws_instance" "app1" {
  ami                  = var.ami
  instance_type        = var.instance_type
  count                = 4
  security_groups      = ["${aws_security_group.app-sg.id}"]
  subnet_id            = "aws_subnet.private5.id"
  availability_zone    = "us-west-1a"
  iam_instance_profile = aws_iam_instance_profile.s3_profile.name
  tags = {
    Name = "app-tier1"
  }
}