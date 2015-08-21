#!/bin/bash

# 清除已有的
docker stop ibbd-nginx 
docker rm ibbd-nginx 
docker rmi ibbd/nginx 

# 重新生成
docker build -t ibbd/nginx ./

