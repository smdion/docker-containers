##STILL IN TESTING

### Usage

    docker run -d -p 80:80 smdion/nginx

#### Attach persistent/shared directories

    docker run -d -p 80:80 -v <sites-enabled-dir>:/etc/nginx/sites-enabled -v <certs-dir>:/etc/nginx/certs -v <log-dir>:/var/log/nginx smdion/nginx

After few seconds, open `http://<host>` to see the welcome page.
