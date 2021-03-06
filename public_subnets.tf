resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.test.id
  cidr_block              = var.subnet_cidrs.public1
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.test.id
  cidr_block              = var.subnet_cidrs.public2
  availability_zone       = "us-west-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public2"
  }
}

