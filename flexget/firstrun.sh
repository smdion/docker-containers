#!/bin/bash

#update to latest version
echo "$(date "+%d.%m.%Y %T"): Updating..."
pip install --upgrade setuptools
pip install --upgrade flexget
flexget -V

# fixing permissions
echo "$(date "+%d.%m.%Y %T"): Fixing Permissions"
chmod -R 777 /config

echo "$(date "+%d.%m.%Y %T"): Launching FlexGet"

# Check if config.yml exists. If not, copy in
if [ -f /config/config.yml ]; then
  echo "Using existing config file."
else
  echo "Creating config.yml from template."
  cp /config.yml  /config/config.yml
  chown nobody:users /config/config.yml
  chmod +x /config/config.yml
fi
