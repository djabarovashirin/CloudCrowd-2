resource "aws_instance" "app" {
  ami           = "0ed9277fb7eb570c9"
  instance_type = "r3.2xlarge"
  count = 8

  tags = {
    Name = "app-tier1"
  }
}