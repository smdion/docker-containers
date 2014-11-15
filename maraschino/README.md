docker-maraschino
==================

This is a Dockerfile setup for Maraschino.  Built in updater to go to current release - http://www.maraschinoproject.com/

    docker run -p 7000:7000 -d --name maraschino -v /path/to/config:/config smdion/docker-maraschino


###Plex GIT Branch

Add the -e PLEX=1 variable to your install for the Plex Module. Cannot be used at same time as -e NZBDRONE=1.

    docker run -p 7000:7000 -e PLEX=1 -d --name maraschino -v /path/to/config:/config smdion/docker-maraschino


###NZBDrone GIT Branch

Add the -e NZBDRONE=1 variable to your install for the NZBDRONE Module, also includes the Plex Module.  Cannot be used at same time as -e PLEX=1.

    docker run -p 7000:7000 -e NZBDRONE=1 -d --name maraschino -v /path/to/config:/config smdion/docker-maraschino

