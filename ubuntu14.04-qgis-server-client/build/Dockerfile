FROM pamtrak06/ubuntu14.04-qgis-server

RUN apt-get update -y && \
    apt-get install -y git software-properties-common

RUN git clone https://github.com/qgis/qgis-web-client.git
WORKDIR /qgis-web-client
#RUN ./install.sh

# not a root user
USER nobody
