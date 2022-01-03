resource "aws_instance" "web" {
  ami                  = data.aws_ami.app_ami.id
  instance_type        = var.instance_type
  count                = 4
  subnet_id            = var.subnet_cidrs.private1
  availability_zone    = "us-west-1a"
  security_groups      = ["${aws_security_group.web-sg.id}"]
  iam_instance_profile = aws_iam_instance_profile.s3_profile.name
  tags = {
    Name = "web-tier1"
  }
}

resource "aws_instance" "web2" {
  ami                  = data.aws_ami.app_ami.id
  instance_type        = var.instance_type
  count                = 4
  subnet_id            = var.subnet_cidrs.private4
  availability_zone    = "us-west-1b"
  security_groups      = ["${aws_security_group.web-sg.id}"]
  iam_instance_profile = aws_iam_instance_profile.s3_profile.name
  tags = {
    Name = "web-tier1"
  }
}
