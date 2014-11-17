#!/bin/bash

# Check if config exists. If not, copy in the sample config
if [ -f /config/DBDefs.pm ]; then
  echo "Using existing config file."
else
  echo "Creating config from template."
  cp /opt/musicbrainz-server/lib/DBDefs.pm.sample /config/DBDefs.pm
  chown nobody:users /config/DBDefs.pm
  echo "Creating database"
  #Create the database
  ./opt/musicbrainz-server/admin/InitDb.pl --createdb --clean
fi
