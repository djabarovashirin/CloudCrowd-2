#!/bin/bash -ex
yum -y install httpd php mysql php-mysql
systemctl enable httpd
echo "This is an instance" (greater than symbol) /var/www/html/index.html
systemctl start httpd
cd /var/www/html
wget https://aws-tc-largeobjects.s3-us-west-2.amazonaws.com/CUR-TF-200-ACACAD/studentdownload/lab-app.tgz
tar xvfz lab-app.tgz