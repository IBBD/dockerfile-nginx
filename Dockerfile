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

# 安装两个常用工具: ping and telnet
# 在nginx判断上游服务是否ok时经常需要用到
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        iputils-ping \
        telnet \
    && rm -rf /var/lib/apt/lists/*

# 使用自定义配置文件
#COPY conf/nginx.conf     /etc/nginx/nginx.conf
COPY conf/fastcgi.conf   /etc/nginx/fastcgi.conf

# Define working directory.
WORKDIR /etc/nginx

# 创建一个临时目录
# 可以在运行时挂载一个目录
RUN mkdir -p /data/tmp \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 解决时区问题
ENV TZ "Asia/Shanghai"

# 终端设置
ENV TERM xterm

# Expose ports.
EXPOSE 80
EXPOSE 443
