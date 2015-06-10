FROM phusion/baseimage:0.9.16
MAINTAINER smdion <me@seandion.com>

# Set correct environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Configure user nobody to match unRAID's settings
RUN \
  usermod -u 99 nobody && \
  usermod -g 100 nobody && \
  usermod -d /home nobody && \
  chown -R nobody:users /home

# Disable SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# install h5ai and patch configuration
RUN \
  add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse" && \
  add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse" && \
  apt-get update -q && \
  apt-get install -qy nginx php5-fpm wget unzip patch && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/* && \
  wget http://release.larsjung.de/h5ai/h5ai-0.24.1.zip && \
  unzip h5ai-0.24.1.zip -d /usr/share/h5ai

# patch h5ai because we want to deploy it ouside of the document root and use /var/www as root for browsing
ADD App.php.patch App.php.patch
RUN patch -p1 -u -d /usr/share/h5ai/_h5ai/server/php/inc/ -i /App.php.patch && \
  rm App.php.patch
RUN cp /usr/share/h5ai/_h5ai/conf/options.json /usr/share/h5ai/_h5ai/conf/options.json.bak
RUN rm /usr/share/h5ai/_h5ai/conf/options.json
RUN ln -s /config/options.json /usr/share/h5ai/_h5ai/conf/options.json

# add h5ai as the only nginx site
ADD h5ai.nginx.conf /etc/nginx/sites-available/h5ai
RUN ln -s /etc/nginx/sites-available/h5ai /etc/nginx/sites-enabled/h5ai
RUN rm /etc/nginx/sites-enabled/default

WORKDIR /var/www

# expose only nginx HTTP port
EXPOSE 80

# Expose Volumes
VOLUME ["/var/www", "/config"]

# Add firstrun.sh to execute during container startup
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh

# Add h5ai to runit
RUN mkdir /etc/service/h5ai
ADD h5ai.sh /etc/service/h5ai/run
RUN chmod +x /etc/service/h5ai/run
