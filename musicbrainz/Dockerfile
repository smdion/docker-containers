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
RUN add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main"
RUN apt-get update -q

# Install Dependencies
RUN apt-get install -qy --force-yes wget perl postgresql-9.3 postgresql-server-dev-9.3 postgresql-contrib-9.3 git-core memcached redis-server build-essential libxml2-dev libpq-dev libexpat1-dev libdb-dev libicu-dev liblocal-lib-perl cpanminus libicu-dev

# Install MusicBrainz=Server
RUN git clone -b master https://github.com/metabrainz/musicbrainz-server.git /opt/musicbrainz-server
RUN git clone -b master https://github.com/metabrainz/postgresql-musicbrainz-collate.git /opt/musicbrainz-server/postgresql-musicbrainz-collate
RUN git clone -b master https://github.com/metabrainz/postgresql-musicbrainz-unaccent.git /opt/musicbrainz-server/postgresql-musicbrainz-unaccent


#set config directory
VOLUME /config

EXPOSE 5000

#Enable local::lib
RUN echo 'eval $( perl -Mlocal::lib )' >> ~/.bashrc
#RUN source ~/.bashrc

#Install PERL dependencies
RUN cpanm --installdeps --notest

#Add unaccent extension
RUN cd /opt/musicbrainz-server/postgresql-musicbrainz-unaccent && make && sudo make install

#Add collate extension
RUN cd /opt/musicbrainz-server/postgresql-musicbrainz-collate && make && sudo make install

#Create the database
RUN ./opt/musicbrainz-server/admin/InitDb.pl --createdb --clean

# Add firstrun.sh to execute during container startup
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh

# Add musicbrainz to runit
RUN mkdir /etc/service/maraschino
ADD musicbrainz.sh /etc/service/musicbrainz/run
RUN chmod +x /etc/service/musicbrainz/run