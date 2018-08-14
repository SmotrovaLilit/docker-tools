#!/bin/bash

mv /var/www/html/.env.prod /var/www/html/.env
(nginx -g "daemon off;" & php-fpm) & /usr/sbin/sshd -D
