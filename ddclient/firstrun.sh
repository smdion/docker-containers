#!/bin/bash

# Check if config exists. If not, copy in the sample config
if [ -f /config/ddclient.conf ]; then
  echo "Using existing config file."
else
  echo "Creating config from template."
  wget -P /config/ https://raw.githubusercontent.com/smdion/docker-containers/master/ddclient/ddclient.conf
  chown nobody:users /config/ddclient.conf
fi
