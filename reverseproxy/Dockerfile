FROM phusion/baseimage:0.9.11
MAINTAINER smdion <smdion@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Install proxy Dependencies
RUN \
  apt-get update -q && \
  apt-get install -qy apache2 php5 libapache2-mod-php5 wget libapache2-mod-proxy-html

# Enable proxy
RUN \
  a2enmod proxy proxy_http proxy_ajp rewrite deflate headers proxy_balancer proxy_connect proxy_html ssl xml2enc && \
  service apache2 restart && \
  rm -R -f /var/www && \
  ln -s /web /var/www && \

# Update apache configuration with this one
RUN \
  mv /etc/apache2/sites-available/000-default.conf /etc/apache2/000-default.conf && \
  rm /etc/apache2/sites-available/* && \
  rm /etc/apache2/apache2.conf && \
  ln -s /config/proxy-config.conf /etc/apache2/sites-available/000-default.conf

ADD apache2.conf /etc/apache2/apache2.conf
ADD ports.conf /etc/apache2/ports.conf

# Manually set the apache environment variables in order to get apache to work immediately.
RUN \
echo www-data > /etc/container_environment/APACHE_RUN_USER && \
echo www-data > /etc/container_environment/APACHE_RUN_GROUP && \
echo /var/log/apache2 > /etc/container_environment/APACHE_LOG_DIR && \
echo /var/lock/apache2 > /etc/container_environment/APACHE_LOCK_DIR && \
echo /var/run/apache2.pid > /etc/container_environment/APACHE_PID_FILE && \
echo /var/run/apache2 > /etc/container_environment/APACHE_RUN_DIR

# Expose Ports
EXPOSE 80 443

# The www directory and proxy config location
VOLUME ["/config", "/web"]

# Add firstrun.sh to execute during container startup
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh

# Add apache to runit
RUN mkdir /etc/service/apache
ADD apache.sh /etc/service/apache/run
RUN chmod +x /etc/service/apache/run
