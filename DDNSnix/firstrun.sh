#!/bin/bash

# Check if config exists. If not, copy in the sample config
if [ -f /config/UnofficialDDNS.yaml ]; then
  echo "Using existing config file."
else
  echo "Creating config from template."
  mv /etc/UnofficialDDNS-dist.yaml /config/UnofficialDDNS.yaml
  chmod 640 /etc/UnofficialDDNS-dist.yaml
fi
