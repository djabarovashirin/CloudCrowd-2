resource "aws_db_instance" "default" {
  allocated_storage    = 32
  engine               = "mysql"
  engine_version       = "5.7.22"
  instance_class       = "db.r3.2xlarge"
  name                 = "mydb"
  username             = "dbadmin"
  password             = "12345"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  multi_az             = true
  storage_type         = "io1"
  db_subnet_group_name = "aws_db_subnet_group.DBSubnetGroup"
}