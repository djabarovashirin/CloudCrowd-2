resource "aws_subnet" "private1" {
  vpc_id                  = aws_vpc.test.id
  cidr_block              = var.subnet_cidrs.private1
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private1"
  }


}
resource "aws_subnet" "private2" {
  vpc_id                  = aws_vpc.test.id
  cidr_block              = var.subnet_cidrs.private2
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private2"
  }
}


resource "aws_subnet" "private3" {
  vpc_id                  = aws_vpc.test.id
  cidr_block              = var.subnet_cidrs.private4
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private3"
  }
}

resource "aws_subnet" "private4" {
  vpc_id                  = aws_vpc.test.id
  cidr_block              = var.subnet_cidrs.private4
  availability_zone       = "us-west-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private4"
  }
}

resource "aws_subnet" "private5" {
  vpc_id                  = aws_vpc.test.id
  cidr_block              = var.subnet_cidrs.private5
  availability_zone       = "us-west-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private5"
  }
}

resource "aws_subnet" "private6" {
  vpc_id                  = aws_vpc.test.id
  cidr_block              = var.subnet_cidrs.private6
  availability_zone       = "us-west-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private6"
  }
}