## Nginx Dockerfile


### Base Docker Image

* ```docker pull nginx```


### Installation

```sh 
git clone git@github.com:IBBD/dockerfile-nginx.git
cd dockerfile-nginx

#sudo docker build -t your-name ./
sudo docker build -t ibbd/nginx ./
```

### Usage

    docker run -d -p 80:80 ibbd/nginx

#### Attach persistent/shared directories

    docker run -d -p 80:80 -v <sites-enabled-dir>:/etc/nginx/conf.d -v <certs-dir>:/etc/nginx/certs -v <log-dir>:/var/log/nginx -v <html-dir>:/var/www/html dockerfile/nginx

After few seconds, open `http://<host>` to see the welcome page.
