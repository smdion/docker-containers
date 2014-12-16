#!/bin/bash

# Start PHP5
php5-fpm --nodaemonize

#Start nginx
nginx -g "daemon off;"
