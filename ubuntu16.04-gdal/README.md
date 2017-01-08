# What is FWTools ?

FWTools is the Open Source GIS Binary Kit for Windows and Linux; which contain :
- OpenEV: A high performance raster/vector desktop data viewer and analysis tool.
- MapServer: A web mapping package.
- GDAL/OGR: A library and set of commandline utility applications for reading and writing a variety of geospatial raster (GDAL) and vector (OGR) formats.
- PROJ.4: A cartographic projections library with commandline utilities.
- OGDI: a multi-format raster and vector reading techology noteworthy for inclusion of support for various military formats including VPF (ie. VMAP, VITD), RPF (ie. CADRG, CIB), and ADRG.
- Python: a scripting language.

> [Source : http://fwtools.maptools.org/ ](http://fwtools.maptools.org/)

# How to use this image

## Build fwtools docker image

This image is built under ubuntu 14.04.
```
docker build -t pamtrak06/fwtools https://raw.githubusercontent.com/pamtrak06/fwtools/master/Dockerfile
```

## Run fwtools docker container

Run container
```
$ docker run -d pamtrak06/fwtools
```

Open a terminal session on a running container
```
$ docker ps
$ docker exec -d pamtrak06/fwtools /bin/bash
```

Exit container without stop it
```
CTRL+P  &  CTRL+Q
```

Get docker vm ip : 
```
$ boot2Docker ip => 192.168.59.103
```

# Helps
GDAL utilities : http://www.gdal.org/gdal_utilities.html / (french version : http://gdal.gloobe.org/gdal/presentation.html)

