resource "aws_instance" "web" {
  ami           = "0ed9277fb7eb570c9"
  instance_type = "t2.large"
  count = 8

  tags = {
    Name = "web-tier1"
  }
}

