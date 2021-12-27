resource "aws_instance" "web" {
  ami               = "0ed9277fb7eb570c9"
  instance_type     = "t2.large"
  count             = 4
  subnet_id         = "aws_subnet.private1.id"
  availability_zone = "us-west-1a"
  security_groups   = ["${aws_security_group.web-sg.id}"]
  iam_instance_profile = "${aws_iam_instance_profile.s3_profile.name}"
  tags = {
    Name = "web-tier1"
  }
}

resource "aws_instance" "web2" {
  ami               = "0ed9277fb7eb570c9"
  instance_type     = "t2.large"
  count             = 4
  subnet_id         = "aws_subnet.private4.id"
  availability_zone = "us-west-1b"
  security_groups   = ["${aws_security_group.web-sg.id}"]
  iam_instance_profile = "${aws_iam_instance_profile.s3_profile.name}"
  tags = {
    Name = "web-tier1"
  }
}
