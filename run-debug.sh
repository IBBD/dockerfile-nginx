#!/bin/bash

docker stop ibbd-nginx
docker rm ibbd-nginx

docker --debug=true run --name ibbd-nginx -d -p 80:80 ibbd/nginx
#docker --debug=true run --name ibbd-nginx -d -p 80:80 -v /usr/local/nginx/conf/vhost:/etc/nginx/sites-enabled -v /var/log/nginx:/var/log/nginx -v /home/code/ibbd:/var/www/html ibbd/nginx

docker ps -a
