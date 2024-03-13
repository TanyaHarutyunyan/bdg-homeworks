#!/bin/bash

yum update
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>It works 1!</h1>" > /var/www/html/index.html