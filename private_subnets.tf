resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.test.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Private1"
  }


}
resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.test.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "Private2"
  }
}


resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.test.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "Private3"
  }
}

resource "aws_subnet" "private4" {
  vpc_id     = aws_vpc.test.id
  cidr_block = "10.0.5.0/24"

  tags = {
    Name = "Private4"
  }
}

resource "aws_subnet" "private5" {
  vpc_id     = aws_vpc.test.id
  cidr_block = "10.0.6.0/24"

  tags = {
    Name = "Private5"
  }
}

resource "aws_subnet" "private6" {
  vpc_id     = aws_vpc.test.id
  cidr_block = "10.0.7.0/24"

  tags = {
    Name = "Private6"
  }
}