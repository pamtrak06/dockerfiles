FROM ubuntu:16.04

MAINTAINER pamtrak06 <pamtrak06@gmail.com>

RUN apt-get update -y && apt-get install -y \ 
    software-properties-common python-software-properties

# Install the application.
RUN  add-apt-repository ppa:ubuntugis/ppa && sudo apt-get update
RUN  apt-get update -y && apt-get install -y gdal-bin

WORKDIR /data
VOLUME ["/data"]

# not root
USER nobody

# Output version and capabilities by default.
CMD gdalinfo --version && gdalinfo --formats && ogrinfo --formats

