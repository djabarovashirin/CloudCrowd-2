data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel*"]
  }
}
resource "aws_launch_configuration" "as_conf" {
  name                 = "GoGreenLaunchConfig"
  image_id             = data.aws_ami.app_ami.id
  instance_type        = t2.micro
  user_data            = <<-EOF








  
#!/bin/bash -ex
yum -y install httpd php mysql php-mysql
chkconfig httpd on
service httpd start
if [ ! -f /var/www/html/lab-app.tgz ]; then
cd /var/www/html
wget https://aws-tc-largeobjects.s3-us-west-2.amazonaws.com/CUR-TF-200-ACACAD/studentdownload/lab-app.tgz
tar xvfz lab-app.tgz
chown apache:root /var/www/html/rds.conf.php
fi
EOF
  security_groups      = ["${aws_security_group.web-sg.id}"]
  iam_instance_profile = aws_iam_instance_profile.s3_profile.name
}
