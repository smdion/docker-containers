#!/bin/bash

# Check if config exists. If not, copy in the sample config
if [ -f /config/config.yml ]; then
  echo "Using existing config file."
else
  echo "Creating dunmmy config.yml."
  cp /config.yml  /config/config.yml
fi



