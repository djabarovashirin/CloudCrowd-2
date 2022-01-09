#!/bin/bash -ex
yum -y install httpd php mysql php-mysql
if [ ! -f /var/www/html/lab-app.tgz ]; then
cd /var/www/html
wget http://download1638.mediafire.com/8jfp6su6v2eg/6e0dz7tswwvfc4i/lab-app.zip
unzip lab-app.zip
cd /var/www/html/lab-app.zip
mv * /var/www/html/
cd /var/www/html/
chown apache:root /var/www/html/rds.conf.php
fi