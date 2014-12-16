#!/bin/bash

# Check if config exists. If not, copy in the sample config
if [ -f /config/UnofficialDDNS.yaml ]; then
  echo "Using existing config file."
  chmod 777 /var/UnofficialDDNS/UnofficialDDNS.log

else
  echo "Creating config from template."
  mv /etc/UnofficialDDNS-dist.yaml /config/UnofficialDDNS.yaml
  chown root:uddns /config/UnofficialDDNS.yaml
  chmod 777 /config/UnofficialDDNS.yaml
  chmod 777 /var/UnofficialDDNS/UnofficialDDNS.log
fi
