#!/bin/bash

# Check if beets.sh exists. If not, copy in
if [ -f /config/beets.sh ]; then
  echo "Using existing config file."
else
  echo "Creating beets.sh from template."
  wget -P /config/ https://raw.githubusercontent.com/smdion/docker-containers/master/beets/src/beets.sh
  wget -P /config/ https://raw.githubusercontent.com/smdion/docker-containers/master/beets/src/config.yaml
  chown nobody:users /config/config.yaml
  chown nobody:users /config/beets.sh
  chmod +x /config/beets.sh
fi
