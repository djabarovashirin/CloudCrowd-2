resource "aws_db_instance" "default" {
  identifier = "test"
  allocated_storage      = 32
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.db_instance_class
  name                   = "mydb"
  username               = "admin"
  password               = 12345678
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  multi_az               = true
  port = 3306
  storage_encrypted = "false"

  db_subnet_group_name   = aws_db_subnet_group.DBSubnetGroup.name
  vpc_security_group_ids = ["${aws_security_group.database-sg.id}"]
}