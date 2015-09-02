#!/bin/bash
#
# 初始化 

# 初始化nginx的配置文件
cp run.sh.example run.sh
cp conf/nginx.conf.example   conf/nginx.conf
cp conf/fastcgi.conf.example conf/fastcgi.conf

echo '==> nginx init is ok!'

