resource "aws_db_subnet_group" "DBSubnetGroup" {
  name       = "db_subnetgroup"
  subnet_ids = [aws_subnet.private3.id, aws_subnet.private6.id, aws_subnet.private2.id, aws_subnet.private4.id]
  tags = {
    Name = "My DB subnet group"
  }
}