# Check if beets.sh exists. If not, copy in the
if [ -f /config/beets.sh ]; then
  echo "Using existing config file."
else
  echo "Creating beets.sh from template."
  wget -P /config/ https://raw.githubusercontent.com/smdion/docker-containers/master/beets/src/beets.sh
  chown nobody:users /config/beets.sh
  chmod +x beets.sh
fi
