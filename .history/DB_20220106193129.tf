resource "aws_db_instance" "default" {
allocated_storage    = 32
engine               = var.engine
engine_version       = var.engine_version
instance_class       = var.db_instance_class
name                 = "mydb"
username             = "dbadmin"
password             = "dbpassword.txt"
parameter_group_name = "default.mysql5.7"
skip_final_snapshot  = true
ulti_az             = true
iops                 = 1
db_subnet_group_name = aws_db_subnet_group.DBSubnetGroup.name
# }