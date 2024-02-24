#!/bin/bash

yum update
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>AWC EC2 instance running httpd</h1>" > /var/www/html/index.html