#!/bin/bash

# 清除已有的
sudo docker stop ibbd-nginx 
sudo docker rm ibbd-nginx 
sudo docker rmi ibbd/nginx 

# 重新生成
sudo docker build -t ibbd/nginx ./

