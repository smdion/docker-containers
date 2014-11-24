#!/bin/bash

# Check if config exists. If not, copy in the sample config
if [ -f /nginxconf/nginx.conf ]; then
  echo "Using existing config file."
else
  echo "Creating config from template."
  cp /etc/nginx/nginx.conf-temp /etc/nginx/nginx.conf && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown nobody:users /nginxconf/nginx.conf
fi


