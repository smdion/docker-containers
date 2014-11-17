##STILL IN TESTING
Forked from: dockerfile / nginx

### Usage

    docker run -d -p 80:80 -p 443:443 -v /path/to/nginx/sites-enabled:/etc/nginx/sites-enabled -v path/to/nginx/certs:/etc/nginx/certs -v path/to/nginx/logs:/var/log/nginx smdion/nginx

After few seconds, open `http://<host>` to see the welcome page.
