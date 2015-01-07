if [ -f "/root/.flexget/config.yml" ]; then" ]; then
echo "using existing config file"

else
echo "creating blank config.yml"
cp /config.yml /root/.flexget/
fi
