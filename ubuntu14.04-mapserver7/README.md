# What is mapserver ?

"MapServer is an Open Source platform for publishing spatial data and interactive mapping applications to the web. Originally developed in the mid-1990’s at the University of Minnesota, MapServer is released under an MIT-style license, and runs on all major platforms (Windows, Linux, Mac OS X). MapServer is not a full-featured GIS system, nor does it aspire to be." 

> [Source : www.mapserver.org ](http://www.mapserver.org)

![logo](http://www.mapserver.org/_static/banner.png)

# How to use this image

## Build a local image

This image is built under ubuntu 14.04 with last mapserver version compilation (currently today the 7 one !).
```
$ git clone https://github.com/pamtrak06/mapserver7-ubuntu14.04.git
$ cd mapserver7-ubuntu14.04
$ docker build -t pamtrak06/mapserver7-ubuntu14.04:latest . 
```

## Run container

```
$ docker run -d -p 8585:80 -v <your local path to mapserver data>/data:/data pamtrak06/mapserver7-ubuntu14.04
```

Data are shared between host (/usr/local/mapserver/data) and container (/data).
All *.map file could be stored in /data and data in /data/maps

Open a terminal session on a running container
```
$ docker ps
$ docker exec -d pamtrak06/mapserver7-ubuntu14.04 /bin/bash
```

Exit container without stop it
```
CTRL+P  &  CTRL+Q
```

Get docker vm ip frm windows or mac : 
```
$ docker-machine env default
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.101:2376"
export DOCKER_CERT_PATH="/Users/jp/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"
# Run this command to configure your shell: 
# eval "$(docker-machine env default)"
```

Test win/mac install  : http://192.168.99.101:8989/cgi-bin/mapserv

Test lin install      : http://<host ip>:8989/cgi-bin/mapserv

```
No query information to decode. QUERY_STRING is set, but empty.
```
## Tutorial
[mapserver first map tutorial in french ](https://github.com/pamtrak06/gis-howto/blob/master/fr_ateliersigcartes-mapservermiseenoeuvre.pdf)

