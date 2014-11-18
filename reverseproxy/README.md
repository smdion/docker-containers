docker-reverseproxy
==================
 
This is a Dockerfile setup for Apache's Reverse Proxy

Example of my .conf file available at http://www.seandion.info/dockers/proxy-config.conf

    docker run -d --net="bridge" --name="proxy" -v /path/to/www:/web -v /path/to/proxy:/config -v /etc/localtime:/etc/localtime:ro -p 80:80 -p 443:443 smdion/docker-reverseproxy
