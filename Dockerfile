#
# Nginx Dockerfile
#
# https://github.com/ibbd/dockerfile-nginx
#

# Pull base image.
FROM ibbd/dockerfile-ubuntu

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# Install Nginx.
# 根据官方文档安装
RUN \
  #apt-get install python-software-properties && \
  #add-apt-repository -y ppa:nginx/stable && \
  wget http://nginx.org/keys/nginx_signing.key && \
  apt-key add nginx_signing.key && \
  echo "deb http://nginx.org/packages/ubuntu/ trusty nginx" >> /etc/apt/sources.list && \
  echo "deb-src http://nginx.org/packages/ubuntu/ trusty nginx" >> /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
