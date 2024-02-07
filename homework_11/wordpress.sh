#!/bin/bash

set -ex

if [ ! "$(docker network ls | grep wordpress)" ]; then
  echo "Creating wordpress network ..."
  docker network create wordpress
else
  echo "wordpress network exists."
fi

if [ ! "$(docker volume ls | grep mysql)" ]; then
  echo "Creating mysql volume ..."
  docker volume create mysql
else
  echo "mysql volume exists."
fi

if [ "$(docker ps -a | grep mysql)" ]; then
  docker rm -f mysql
fi

echo "Creating mysql container ..."

docker run -d --name mysql --network wordpress --restart unless-stopped -v mysql:/var/lib/mysql --env MYSQL_ROOT_PASSWORD=root --env MYSQL_DATABASE=wordpress --env MYSQL_USER=wordpress --env MYSQL_PASSWORD=wordpress mysql

if [ "$(docker ps -a | grep wordpress)" ]; then
  docker rm -f wordpress
fi

echo "Creating wordpress container ..."

if [ ! -d ~/tmp/html ]; then
  mkdir -p ~/tmp/html
fi

docker run -d --name wordpress --network wordpress --restart unless-stopped -v /home/tanya/tmp/html:/var/www/html --env WORDPRESS_DB_HOST=mysql --env WORDPRESS_DB_USER=wordpress --env WORDPRESS_DB_PASSWORD=wordpress --env WORDPRESS_DB_NAME=wordpress -p 8000:80 wordpress

echo -e "\n"
echo -e "\033[32m Success! Wordpress is running on http://localhost:8000! \033[0m"
echo -e "\n"