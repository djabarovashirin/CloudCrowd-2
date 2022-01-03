resource "aws_security_group" "elb-sg" {
  name        = "elb-sg"
  description = "Allow Access at Port 443"
  vpc_id      = aws_vpc.test.id

  ingress {
    description = "HTTPS from anywhere"
    from_port   = 443
    to_port     = 443
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

resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  description = "Allow Access at Port 8080"
  vpc_id      = aws_vpc.test.id

  ingress {
    description = "Traffic to the web server"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    #we need to create ELB and include the cidr range
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    #Outbound Rule: only connects to the App tier - we need App Tier Cidr
  }

  tags = {
    Name = "web-sg"
  }
}

resource "aws_security_group" "app-sg" {
  name        = "app-sg"
  description = "Allow Access at Port 8080"
  vpc_id      = aws_vpc.test.id

  ingress {
    description = "Traffic to the web server"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    #we need to connect to Web
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    #Outbound Rule: only connects to the DB tier - we need App Tier Cidr
  }

  tags = {
    Name = "app-sg"
  }
}

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

  tags = {
    Name = "database-sg"
  }
}

resource "aws_security_group" "bastion-sg" {
  name        = "bastion-sg"
  description = "Allow Access at Port 22"
  vpc_id      = aws_vpc.test.id

  ingress {
    description = "Traffic from ELB "
    from_port   = 22
    to_port     = 22
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "bastion-sg"
  }
}