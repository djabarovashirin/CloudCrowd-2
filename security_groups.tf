
##########APP LOAD BALANCER SG
resource "aws_security_group" "elb-sg" {
  name        = "elb-sg"
  description = "Allow Access to ELB from Anywhere"
  vpc_id      = aws_vpc.test.id

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "elb-sg"
  }
}

#############EC2 SG
resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  description = "Allow Access for ELB"
  vpc_id      = aws_vpc.test.id

  ingress {
    description = "Traffic to the web server from ELB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    #we need to create ELB and include the cidr range
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "ec2-web-sg"
  }
}
#########RDS SG
resource "aws_security_group" "database-sg" {
  name        = "database-sg"
  description = "Allow Access at Port 3306"
  vpc_id      = aws_vpc.test.id

  ingress {
    description = "Traffic from the app tier"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    #we need the app tier IP 
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "database-sg"
  }
}



resource "aws_security_group" "elb-sg-private" {
  name        = "elb-sg-private"
  description = "Allow Access to ELB from VPC"
  vpc_id      = aws_vpc.test.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = ["${aws_security_group.elb-sg.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "elb-sg-private"
  }
}