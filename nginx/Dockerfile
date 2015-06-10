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

# Install Nginx.
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx inotify-tools && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/* && \
  cp /etc/nginx/nginx.conf /etc/nginx/nginx-template.conf  && \
  rm /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/nginxconf"]

# Set config.js to under config
RUN ln -s /nginxconf/nginx.conf /etc/nginx/nginx.conf

# Expose ports.
EXPOSE 80 443

# Add firstrun.sh to execute during container startup
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh

# Add inotify.sh to execute during container startup
RUN mkdir /etc/service/inotify
ADD inotify.sh /etc/service/inotify/run
RUN chmod +x /etc/service/inotify/run

# Add nginx to runit
RUN mkdir /etc/service/nginx
ADD nginx-run.sh /etc/service/nginx/run
RUN chmod +x /etc/service/nginx/run
ADD nginx-finish.sh /etc/service/nginx/finish
RUN chmod +x /etc/service/nginx/finish
