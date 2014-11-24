#!/bin/bash

# Check if config exists. If not, copy in the sample config
if [ -f /nginxconf/nginx.conf ]; then
  echo "Using existing config file."
else
  echo "Creating config from template."
  cp /etc/nginx/nginx.conf-temp /nginxconf/nginx.conf
  echo "\ndaemon off;" >> /nginxconf/nginx.conf
  chown nobody:users /nginxconf/nginx.conf
fi


