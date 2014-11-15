# h5ai

[h5ai](http://larsjung.de/h5ai/) is a modern web server index.
This [docker](https://www.docker.io/) image makes it trivially easy to
spin up a webserver and start sharing your files through the web.

This is a fork from clue/docker-h5ai for use on unRAID docker.  Moved to phusion and moved config.json outside of docker.

![screenshot](https://cloud.githubusercontent.com/assets/776829/3098666/440f3ca6-e5ef-11e3-8979-36d2ac1a36a0.png)

See also the [demo directory](http://larsjung.de/h5ai/sample).

## Usage

docker run -p 8888:80 --name=h5ai -v /path/of/directory/to/share:/var/www -v /path/to/config:/config smdion/docker-h5ai

## Reverse Proxy

I put it behind a reverse proxy to use .htaccess to protect access


`<VirtualHost *:80>`
		
		ServerName software.domain.com

		ProxyPass / http://10.10.10.11:8888/
		ProxyPassReverse / http://10.10.10.11:8888/
		ProxyPassReverseCookiePath / /
		
		<Location "/">
		AuthUserFile /config/.htpasswd
		AuthType Basic
		AuthName "Software Downloads"
		Require user admin
		</Location>
`</VirtualHost>`
