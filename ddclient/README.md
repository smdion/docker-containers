docker-ddclient
==================

This is a Dockerfile setup for DDClient. Client to update DynDNS service.

Conf file Config Tool: https://account.dyn.com/tools/clientconfig.html

Edit /config/ddclient.conf


    docker run -d --name="DDClient" --net="host" -v "/path/to/config":"/config":rw smdion/docker-ddclient
