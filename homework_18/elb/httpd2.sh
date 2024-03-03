#!/bin/bash

yum update
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>It works 2!</h1>" > /var/www/html/index.html