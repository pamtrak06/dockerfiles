FROM ubuntu:16.04

MAINTAINER pamtrak06 <pamtrak06@gmail.com>

# Install the application.
ADD . /usr/local/src/gdal-docker/
RUN apt-get update -y && \
    apt-get install -y make && \
    make -C /usr/local/src/gdal-docker install clean && \
    apt-get purge -y make

# Externally accessible data is by default put in /data
WORKDIR /data
VOLUME ["/data"]

# Execute the gdal utilities as nobody, not root
USER nobody

# Output version and capabilities by default.
CMD gdalinfo --version && gdalinfo --formats && ogrinfo --formats

