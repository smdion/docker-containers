#!/bin/bash

# Check if beets.sh exists. If not, copy in
if [ -f /config/beets.sh ]; then
  echo "Using existing config file."
else
  echo "Creating beets.sh from template."
  wget -P /config/ https://raw.githubusercontent.com/smdion/docker-containers/master/beets/src/beets.sh
  chown nobody:users /config/beets.sh
  chmod +x /config/beets.sh
fi
# Check if config.yaml exists. If not, copy in
if [ -f /config/config.yaml ]; then
  echo "Using existing config file."
else
  echo "Creating config.yaml from template."
  wget -P /config/ https://raw.githubusercontent.com/smdion/docker-containers/master/beets/src/config.yaml
  chown nobody:users /config/config.yaml
fi
