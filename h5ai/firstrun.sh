#!/bin/bash

# Check if config exists. If not, copy in the sample config
if [ -f /config/options.json ]; then
  echo "Using existing config file."
else
  echo "Creating config from template."
  mv  /usr/share/h5ai/_h5ai/conf/options.json.bak /config/options.json
fi
