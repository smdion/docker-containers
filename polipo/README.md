docker-polipo
=============

A docker for Polpio - http://www.pps.univ-paris-diderot.fr/~jch/software/polipo/

Polipo is a small and fast caching web proxy (a web cache, an HTTP proxy, a proxy server). 

    docker run -p 8123:8123 -d --name polipo -v /path/to/config:/config smdion/docker-polipo
