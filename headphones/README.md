This is a Dockerfile setup for headphones - 

By default this Docker installs the latest stable version of headphones:

docker run -d --net="host" --name="headphones" -v /path/to/headphones/data:/config -v /path/to/downloads:/downloads -v /path/to/music:/music -v /etc/localtime:/etc/localtime:ro -p 8181:8181 sacretagent/needo-headphones

Edge
----
If you would like to run the latest updates from the master branch as well as enable in-app updates run:

docker run -d --net="host" --name="headphones" -v /path/to/headphones/data:/config -v /path/to/downloads:/download
s -v /path/to/music:/music -v /etc/localtime:/etc/localtime:ro -e EDGE=1 -p 8181:8181 sacretagent/needo-headphones
