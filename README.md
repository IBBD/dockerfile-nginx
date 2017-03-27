## Nginx Dockerfile

### 基础镜像

- `docker pull nginx`
- 最新稳定版


### 安装

- 从dockerfile编译

```sh 
git clone git@github.com:IBBD/dockerfile-nginx.git
cd dockerfile-nginx

sudo docker build -t ibbd/nginx ./
```

- 直接从`hub.docker.com`下载镜像

```sh 
docker pull ibbd/nginx
```

### Usage

- 简单应用

```sh
docker run -d -p 80:80 ibbd/nginx
```
- 比较完整的应用

```sh
# 代码目录
code_path=/var/www

# nginx配置目录
conf_path=/etc/nginx/nginx-conf/product-env

# nginx日志目录
logs_path=/var/log/nginx

current_path=$(pwd)
docker run --name=ibbd-nginx -d \
    -p 80:80 \
    --link ibbd-php-fpm:php-fpm \
    -v $code_path:/var/www \
    -v $logs_path:/var/log/nginx \
    -v $conf_path:/etc/nginx/sites-enabled:ro \
    -v $current_path/conf/nginx.conf:/etc/nginx/nginx.conf:ro \
    --volumes-from ibbd-php-fpm \
    ibbd/nginx 
```

完整代码见：`./run.sh.example`

说明：

- 需要先从镜像 ibbd/php-fpm 上启动容器 ibbd-php-fpm

