#!/bin/bash

docker stop ibbd-nginx 
docker rm ibbd-nginx 

docker run --name=ibbd-nginx -d \
    -p 80:80 \
    --link ibbd-php-fpm:php-fpm \
    -v /etc/nginx/sites-enabled:/etc/nginx/sites-enabled \
    -v /var/log/nginx:/var/log/nginx \
    -v /home/code/ibbd:/var/www \
    --volumes-from ibbd-php-fpm \
    ibbd/nginx

docker ps

