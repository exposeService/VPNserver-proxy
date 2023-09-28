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

WG_QUICK_USERSPACE_IMPLEMENTATION=boringtun-cli
WG_SUDO=1

wg-quick up wg0

nginx -g "daemon off;"
