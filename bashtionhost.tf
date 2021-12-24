resource "aws_instance" "bhost" {
  ami           = "0ed9277fb7eb570c9"
  instance_type = "t2.micro"
  count = 2

  tags = {
    Name = "bashtion host"
  }
}
