docker-htpcmanager
==================

This is a Dockerfile setup for htpcmanager v0.11.0.  Built in updater to go to current release - http://htpc.io/

You may need to start/stop Docker after initial install to allow updater to work.

    docker run -p 8085:8085 -v /path/to/config:/config -d --name htpcmanager smdion/docker-htpcmanager