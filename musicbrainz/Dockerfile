FROM phusion/baseimage:0.9.11
MAINTAINER smdion <smdion@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody

RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse"
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse"
RUN apt-get update -q

# Install Dependencies
RUN apt-get install -qy perl postgresql-9.x postgresql-server-dev-9.x postgresql-contrib-9.x git-core memcached redis-server build-essential libxml2-dev libpq-dev libexpat1-dev libdb-dev libicu-dev liblocal-lib-perl cpanminus libicu-dev

# Install MusicBrainz=Server
RUN mkdir /opt/musicbrainz-server
RUN wget -P /tmp/ https://github.com/metabrainz/musicbrainz-server/archive/v-2014-11-03.tar.gz
RUN tar -C /opt/musicbrainz-server -xvf /tmp/v-2014-11-03.tar.gz --strip-components 1

#set config directory
VOLUME /config

# Add firstrun.sh to execute during container startup
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh

# Add musicbrainz to runit
RUN mkdir /etc/service/maraschino
ADD musicbrainz.sh /etc/service/musicbrainz/run
RUN chmod +x /etc/service/musicbrainz/run

#Enable local::lib
RUN echo 'eval $( perl -Mlocal::lib )' >> ~/.bashrc
RUN source ~/.bashrc

#Install PERL dependencies
RUN cpanm --installdeps --notest

#Add unaccent extension
RUN cd /opt/musicbrainz-server/postgresql-musicbrainz-unaccent && make && sudo make install

#Add collate extension
RUN cd /opt/musicbrainz-server/postgresql-musicbrainz-collate && make && sudo make install

#Create the database
RUN ./opt/musicbrainz-server/admin/InitDb.pl --createdb --clean

