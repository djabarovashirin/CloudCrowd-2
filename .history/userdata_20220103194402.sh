#!/bin/bash -ex
yum -y install httpd php mysql php-mysql
sudo chkconfig httpd on
systemctl enable httpd 
systemctl start httpd
cd /var/www/html
wget https://aws-tc-largeobjects.s3-us-west-2.amazonaws.com/CUR-TF-200-ACACAD/studentdownload/lab-app.tgz
tar xvfz lab-app.tgz
chown apache:root /var/www/html/rds.conf.php
fi