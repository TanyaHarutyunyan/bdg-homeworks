#!/bin/bash

apt update
apt install -y nginx
systemctl start nginx
systemctl enable nginx
echo "<h1>AWC EC2 instance running nginx</h1>" > /var/www/html/index.nginx-debian.html