#
# Nginx Dockerfile
#
# https://github.com/ibbd/dockerfile-nginx
#
# sudo docker build -t ibbd/nginx ./
#

# Pull base image.
FROM nginx:latest

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# 使用自定义配置文件
COPY nginx.conf   /etc/nginx/nginx.conf
COPY fastcgi.conf /etc/nginx/fastcgi.conf

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443

