#!/bin/bash

#update to latest version
pip install --upgrade setuptools
pip install --upgrade flexget

# Check if config.yml exists. If not, copy in
if [ -f /config/config.yml ]; then
  echo "Using existing config file."
else
  echo "Creating config.yml from template."
  cp /config.yml  /config/config.yml
  chown nobody:users /config/config.yml
  chmod +x /config/config.yml
fi
