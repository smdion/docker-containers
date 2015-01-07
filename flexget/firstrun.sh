#!/bin/bash

# Check if config.yml exists. If not, copy in
if [ -f /config/config.yml ]; then
  echo "Using existing config file."
else
  echo "Creating config.yml from template."
  wget -P /config/ https://raw.githubusercontent.com/smdion/docker-containers/master/flexget/config.yml
  chown nobody:users /config/config.yml
  chmod +x /config/config.yml
fi
