
#PUBLIC ROUTE TABLES
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "pub-sub1-rta" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_route_table_association" "pub-sub2-rta" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public-rt.id
}


#PRIVATE ROUTE TABLES BELOW


resource "aws_route_table" "ng-rt" {
  vpc_id = aws_vpc.test.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gogreen_ng.id
  }

  tags = {
    Name = "Nat Gateway Route Table"
  }
}

resource "aws_route_table_association" "ngw-rt-as" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.ng-rt.id
}
resource "aws_route_table_association" "ngw-rt-as2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.ng-rt.id
}