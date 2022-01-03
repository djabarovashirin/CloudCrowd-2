resource "aws_instance" "bhost" {
  ami               = "0ed9277fb7eb570c9"
  instance_type     = "t2.micro"
  count             = 1
  subnet_id         = "aws_subnet.public1.id"
  availability_zone = "us-west-1a"
  security_groups   = ["${aws_security_group.bastion-sg.id}"]

  tags = {
    Name = "bastion host"
  }
}

resource "aws_instance" "bhost2" {
  ami               = "0ed9277fb7eb570c9"
  instance_type     = "t2.micro"
  count             = 1
  subnet_id         = "aws_subnet.public2.id"
  availability_zone = "us-west-1b"
  security_groups   = ["${aws_security_group.bastion-sg.id}"]

  tags = {
    Name = "bastion host"
  }
}
