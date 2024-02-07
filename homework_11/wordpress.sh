docker network create wordpress
docker network ls
docker volume create mysql
docker run -d --name my-sql -e MYSQL_ROOT_PASSWORD=root --network wordpress --restart unless-stopped -v wordpress-vol:/var/lib/mysql -p 3307:3306 mysql:latest
docker run -d --name mysql --network wordpress --restart unless-stopped -v mysql:/var/lib/mysql --env MYSQL_ROOT_PASSWORD=root --env MYSQL_DATABASE=wordpress --env MYSQL_USER=wordpress --env MYSQL_PASSWORD=wordpress
docker run -d --name wordpress --network wordpress --restart unless-stopped -v /home/tanya/tmp/html:/var/www/html -p 8081:80 --env WORDPRESS_DB_HOST=mysql --env WORDPRESS_DB_USER=wordpress --env WORDPRESS_DB_PASSWORD=wordpress --env WORDPRESS_DB_NAME=wordpress wordpress
