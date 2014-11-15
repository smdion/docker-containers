docker-ddclient
==================

This is a Dockerfile setup for DDClient. Client to update DynDNS service.

Edit /config/ddclient.conf


    docker run -v /path/to/config:/config -d --name ddclient smdion/docker-ddclient
