#!/bin/bash
 
# Check if config exists. If not, copy in the sample config
if [ -f /config/polipo.conf ]; then
  echo "Using existing config file."
else
  echo "Creating config from template."
  cp /usr/share/doc/polipo/examples/config.sample /config/polipo.conf
  chown nobody:users /config/polipo.conf
fi
 
#Allow outside access
sed -i -e 's/# proxyAddress = "0.0.0.0"/proxyAddress = "0.0.0.0"/' /config/polipo.conf

#set cache folder
sed -i '61,64d' /config/polipo.conf
sed -i -e 's/# diskCacheRoot/diskCacheRoot/g' /config/polipo.conf
sed -i 's|'"~/.polipo-cache/"'|'"/config/cache/"'|' /config/polipo.conf

#high memory
sed -i -e 's/# chunkHighMark = 50331648/chunkHighMark = 50331648/' /config/polipo.conf
sed -i -e 's/# objectHighMark = 16384/objectHighMark = 16384/' /config/polipo.conf

#disable indexing/servers list
sed -i -e 's/# disableIndexing = false/disableIndexing = false/' /config/polipo.conf
sed -i -e 's/# disableServersList = false/disableServersList = false/' /config/polipo.conf

#increase security
sed -i -e 's/# censoredHeaders = from, accept-language/censoredHeaders = from, accept-language/' /config/polipo.conf
sed -i -e 's/# censorReferer = maybe/censorReferer = maybe/' /config/polipo.conf

#set expire time
echo "serverExpireTime = 5d" >>/config/polipo.conf

#only allow internal clients
sed -i '23d' /config/polipo.conf
sed -i -e 's|# allowedClients = 127.0.0.1|allowedClients = 127.0.0.1, 10.0.0.0/8, 172.16.0.0/12,192.168.0.0/16|' /config/polipo.conf

#set proxy name
sed -i -e 's/# proxyName = "polipo.example.org"/proxyName = "unRAID Polipo"/' /config/polipo.conf

# Verify and create directory
if [[ ! -e /config/cache ]]; then
  mkdir -p /config/cache
  chown nobody:users /config/cache
fi