FROM phusion/baseimage:0.9.15
MAINTAINER smdion <me@seandion.com>

ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody
RUN usermod -d /config nobody

ADD sources.list /etc/apt/
RUN apt-get update -qq && \
    apt-get install -qq --force-yes python2.7 python-pip python-transmissionrpc && \
    apt-get autoremove && \
    apt-get autoclean && \
    pip install flexget

VOLUME /config
RUN ln -sf /config /root/.flexget

# Add flexget-webui to runit
RUN mkdir /etc/service/flexget-webui
ADD flexget-webui.sh /etc/service/flexget-webui/run
RUN chmod +x /etc/service/flexget-webui/run
