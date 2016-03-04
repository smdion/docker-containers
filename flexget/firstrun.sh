#!/bin/bash

echo "$(date "+%d.%m.%Y %T"): Launching FlexGet"
#update to latest version
echo "$(date "+%d.%m.%Y %T"): Updating..."
pip install --upgrade flexget
flexget -V

# fixing permissions
echo "$(date "+%d.%m.%Y %T"): Fixing Permissions"
chmod -R 777 /config
# moving custom plugins
echo "$(date "+%d.%m.%Y %T"): Moving Custom Plugins (from /config/Search-Plugins/)"
cp /config/Search-Plugins/*.py /usr/local/lib/python2.7/dist-packages/flexget/plugins

# Check if config.yml exists. If not, copy in
if [ -f /config/config.yml ]; then
  echo "Using existing config file."
else
  echo "Creating config.yml from template."
  cp /config.yml  /config/config.yml
  chown nobody:users /config/config.yml
  chmod +x /config/config.yml
fi
