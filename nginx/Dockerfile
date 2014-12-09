FROM phusion/baseimage:0.9.11
MAINTAINER smdion <smdion@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Install Nginx.
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
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

# Add nginx to runit
RUN mkdir /etc/service/nginx
ADD nginx.sh /etc/service/nginx/run
RUN chmod +x /etc/service/nginx/run
