FROM pamtrak06/ubuntu16.04-gis
USER root

MAINTAINER pamtrak06 <pamtrak06@gmail.com>

RUN  apt-get update -y && apt-get install -y gdal-bin

WORKDIR /data
VOLUME ["/data"]

# not root
USER nobody

# Output version and capabilities by default.
CMD gdalinfo --version && gdalinfo --formats && ogrinfo --formats

