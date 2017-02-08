#!/bin/bash
yum update -y
yum install -y httpd mod_ssl php php-mysql wget nfs-utils stress mc
chkconfig httpd on
echo "Online!" > /var/www/html/healthy.txt
