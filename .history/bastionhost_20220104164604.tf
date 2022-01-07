resource "aws_instance" "bhost" {
  ami               = var.ami
  instance_type     = var.instance_type
  
  subnet_id         = aws_subnet.public1.id
  availability_zone = "us-west-1a"
  security_groups   = ["${aws_security_group.bastion-sg.id}"]

  tags = {
    Name = "bastion host"
  }
}

# resource "aws_instance" "bhost2" {
#   ami               = var.ami
#   instance_type     = var.instance_type
  
#   subnet_id         = "aws_subnet.public2.id"
#   availability_zone = "us-west-1b"
#   security_groups   = ["${aws_security_group.bastion-sg.id}"]

#   tags = {
#     Name = "bastion host"
#   }
# }
