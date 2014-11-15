FROM phusion/baseimage:0.9.11
MAINTAINER smdion <smdion@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
  nginx php5-fpm supervisor \
  wget unzip patch

# install h5ai and patch configuration
RUN wget http://release.larsjung.de/h5ai/h5ai-0.24.1.zip
RUN unzip h5ai-0.24.1.zip -d /usr/share/h5ai

# patch h5ai because we want to deploy it ouside of the document root and use /var/www as root for browsing
ADD App.php.patch App.php.patch
RUN patch -p1 -u -d /usr/share/h5ai/_h5ai/server/php/inc/ -i /App.php.patch && rm App.php.patch

RUN rm /usr/share/h5ai/_h5ai/conf/options.json
RUN ln -s /config/options.json /usr/share/h5ai/_h5ai/conf/options.json


# add h5ai as the only nginx site
ADD h5ai.nginx.conf /etc/nginx/sites-available/h5ai
RUN ln -s /etc/nginx/sites-available/h5ai /etc/nginx/sites-enabled/h5ai
RUN rm /etc/nginx/sites-enabled/default

WORKDIR /var/www

# use supervisor to monitor all services
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD supervisord -c /etc/supervisor/conf.d/supervisord.conf

# expose only nginx HTTP port
EXPOSE 80

# expose path
VOLUME /var/www
VOLUME /config
