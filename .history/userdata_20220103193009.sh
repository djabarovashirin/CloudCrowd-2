#!/bin/bash -ex
yum -y install httpd php mysql php-mysql
chkconfig httpd on
systemctl start httpd.service
systemctl.py /usr/bin/systemctl
chmod a+x /usr/bin/systemctl
systemctl enable httpd 
systemctl start httpd
if [ ! -f /var/www/html/lab-app.tgz ]; then
cd /var/www/html
wget https://aws-tc-largeobjects.s3-us-west-2.amazonaws.com/CUR-TF-200-ACACAD/studentdownload/lab-app.tgz
tar xvfz lab-app.tgz
chown apache:root /var/www/html/rds.conf.php
fi