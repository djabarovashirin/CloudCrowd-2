#!/bin/bash -ex
yum -y install httpd php mysql php-mysql
systemctl start httpd.service
cd /var/www/html
wget https://aws-tc-largeobjects.s3-us-west-2.amazonaws.com/CUR-TF-200-ACACAD/studentdownload/lab-app.tgz
tar xvfz lab-app.tgz