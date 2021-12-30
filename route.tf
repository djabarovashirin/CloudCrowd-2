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
    subnet_id = aws_subnet.subnet1.id
    route_table_id = aws_route_table.public-rt 
    }
resource "aws_route_table_association" "pub-sub2-rta" {
    subnet_id = aws_subnet.subnet2.id
    route_table_id = aws_route_table.public-rt.id 
    }
