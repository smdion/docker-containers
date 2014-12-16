#!/bin/bash

# Start PHP5
/usr/sbin/php5-fpm --nodaemonize

#Start nginx
/usr/sbin/nginx -g "daemon off;"