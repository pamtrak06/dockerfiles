# What is degree ?

"deegree is open source software for spatial data infrastructures and the geospatial web. deegree offers components for geospatial data management, including data access, visualization, discovery and security. Open standards are at the heart of deegree."

> [Source : http://www.deegree.org ](http://www.deegree.org)

![logo](http://www.deegree.org/images/logos/deegree.png)

# How to use this image

## Build a local image

This image is built under ubuntu 16.04 with last degree version compilation (currently today the 3.3.20 one !).
```
$ git clone https://github.com/pamtrak06/ubuntu16.04-degree-3.3.20.git
$ cd ubuntu16.04-degree-3.3.20.git
$ docker build -t pamtrak06/ubuntu16.04-degree-3.3.20 .
```

## Run container 

```
$ docker run -d -p 8080:8080 -v <your local path to mapserver data>/data:/data pamtrak06/ubuntu16.04-degree-3.3.20
```

Data are shared between host (/usr/local/mapserver/data) and container (/data).
All *.map file could be stored in /data and data in /data/maps

Open a terminal session on a running container
```
$ docker ps
$ docker exec -d pamtrak06/ubuntu16.04-degree-3.3.20 /bin/bash
```

Exit container without stop it
```
CTRL+P  &  CTRL+Q
```

Get docker vm ip frm windows or mac :
```
$ docker-machine env default
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/jp/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"
# Run this command to configure your shell:
# eval "$(docker-machine env default)"
```

Test win/mac install  : http://192.168.99.100:8080

Test lin install      : http://[host ip]:8080

![logo](http://download.deegree.org/documentation/3.3.19/html/_images/console_start.jpg)
