FROM ubuntu16.04-qgis-server

RUN apt-get update -y && \
    apt-get install -y git

RUN git clone https://github.com/qgis/qgis-web-client.git
WORKDIR /qgis-web-client
RUN ./install.sh
