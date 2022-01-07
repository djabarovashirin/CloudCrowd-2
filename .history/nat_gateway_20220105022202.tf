resource "aws_nat_gateway" "gogreen_ng" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.public1.id

  tags = {
    Name = "gogreen_ng"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}