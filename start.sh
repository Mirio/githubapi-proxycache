#!/bin/sh

mkdir -p /run/nginx/ /var/cache/nginx
chown -R nginx:nginx /run/nginx /var/cache/nginx

nginx
