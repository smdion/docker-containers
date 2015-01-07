if [ -f "/config/config.yml" ]; then" ]; then
echo "using existing config file"

else
echo "creating blank config.yml"
cp /config.yml /config/config.yml
fi
