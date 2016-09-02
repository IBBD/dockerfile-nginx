#
# Nginx Dockerfile
#
# https://github.com/ibbd/dockerfile-nginx
#
# sudo docker build -t ibbd/nginx ./
#

# Pull base image.
FROM nginx:stable

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# Define mountable directories.
#VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/var/log/nginx", "/var/www"]

# 使用自定义配置文件
#COPY conf/nginx.conf     /etc/nginx/nginx.conf
COPY conf/fastcgi.conf   /etc/nginx/fastcgi.conf

# Define working directory.
WORKDIR /etc/nginx

# 创建一个临时目录
# 可以在运行时挂载一个目录
RUN mkdir -p /data/tmp

# 解决时区问题
env TZ "Asia/Shanghai"

# Define default command.
# 加上这个会启动不了
#CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443

