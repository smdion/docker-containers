#!/bin/bash

# Check if config exists. If not, copy in the sample config
if [ -f /config/ddclient.conf ]; then
  echo "Using existing config file."
else
  echo "Creating config from template."
  mv /etc/ddclient.conf-sample /config/ddclient.conf
  chown nobody:users /config/ddclient.conf
fi
