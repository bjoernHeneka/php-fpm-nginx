#!/bin/bash

# start fpm as daemon
php-fpm -D

# Start nginx as master priocess in foreground
php-fpm && nginx -g 'daemon off;'