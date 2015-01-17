#!/bin/bash

# Check if config exists. If not, copy in the sample config
if [ -f /config/config.yaml ]; then
  echo "Using existing config file."
else
  echo "Creating config from template."
  mv etc/config.yaml.example /config/config.yaml
  chown nobody:users /config/config.yaml
fi
