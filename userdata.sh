#!/bin/bash -ex
yum -y install httpd php mysql php-mysql
if [ ! -f /var/www/html/lab-app.tgz ]; then
cd /var/www/html
wget https://download1638.mediafire.com/ed7sa2kdm1ng/6e0dz7tswwvfc4i/lab-app.zip
unzip lab-app.tgz
chown apache:root /var/www/html/rds.conf.php
fi