FROM pamtrak06/ubuntu16.04-apache2-python
USER root
RUN apt-get update -y && apt-get install -y qgis-server libapache2-mod-fcgid

#RUN apt-get update -y && apt-get install -y wget && \
#    echo deb http://qgis.org/ubuntugis-ltr xenial main > /etc/apt/sources.list.d/debian-gis.list && \
#    echo deb-src http://qgis.org/ubuntugis-ltr xenial main >> /etc/apt/sources.list.d/debian-gis.list && \
#    wget -O - http://qgis.org/downloads/qgis-2016.gpg.key | gpg --import && \
#    gpg --fingerprint 073D307A618E5811 && \
#    gpg --export --armor 073D307A618E5811 | apt-key add -

#RUN apt-get update -y && apt-get upgrade -y && \
#    apt-get install -y libapache2-mod-fcgid
    # qgis python-qgis qgis-plugin-grass qgis-server python-qgis

RUN a2enmod fcgid
RUN a2enconf serve-cgi-bin
USER nobody
