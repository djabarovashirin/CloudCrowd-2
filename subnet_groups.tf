resource "aws_db_subnet_group" "DBSubnetGroup" {
  name       = "db_subnetgroup"
  subnet_ids = [aws_subnet.private3.id, aws_subnet.private6.id]

  tags = {
    Name = "My DB subnet group"
  }
}