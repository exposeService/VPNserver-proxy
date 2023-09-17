#!/bin/bash

cat > /etc/nginx/nginx.conf << EOL
user  nginx;
worker_processes  auto;

error_log  /var/log/nginx/error.log notice;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}

stream {
    server {
        listen ${PORT};
        proxy_pass ${SERVER};
    }
}
EOL

nginx -g "daemon off;"
