#!/bin/bash
 
# Check if config exists. If not, copy in the sample config
if [ -f /config/polipo.conf ]; then
  echo "Using existing config file."
else
  echo "Creating config from template."
  mv /usr/share/doc/polipo/examples/config.sample /config/polipo.conf
  chown nobody:users /config/polipo.conf
fi
 
#Allow outside access
sed -i -e 's/# proxyAddress = "0.0.0.0"/proxyAddress = "0.0.0.0"/' /config/polipo.conf

#set cache folder
sed -i '61,64d' /config/polipo.conf
sed -i -e 's/# diskCacheRoot/diskCacheRoot/g' /config/polipo.conf
sed -i 's|'"~/.polipo-cache/"'|'"/config/cache/"'|' /config/polipo.conf

# Verify and create directory
if [[ ! -e /config/cache ]]; then
  mkdir -p /config/cache
  chown nobody:users /config/cache
fi
