#!/bin/sh

echo "Starting MariaDB..."
rc-service mariadb start

echo "Starting Nginx..."
nginx

tail -f /dev/null