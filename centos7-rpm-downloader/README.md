# Yum downloader

## Objectives

Allow to download yum package in rpm binary form and dependencies for deconnected installation.

## Installation

docker pull pamtrak06/centos7-rpm-downloader

## Usage

### 1. Knowing when process is finished

File tree.log is present when the process is finished
watch $PWD/volumes/packages

Every 2,0s: ls volumes/packages                      Wed Dec  6 01:30:59 2017

curl
tree.log
wget

Other potentiel monitoring :
- watch cat volumes/packages/tree.log
- watch tree volumes/packages


### 2. Just make a test, no download.

Following command simulate download package wget and curl with recursivity (max 2 levels) in shared folder $PWD/volumes/packages. Container will be deleted after process.

```bash
docker run -d --name rpm-downloader_1 -v $PWD/volumes/packages:/packages -e RPM_LIST="wget curl" -e RECURSIVE_MODE=true -e TRACE_ONLY_MODE=true -e RECURSIVE_MAX_LEVEL=2 --rm pamtrak06/centos7-rpm-downloader && docker logs pm-downloader_1
```

### 3. Download wget and curl rpm with their dependencies to max 2 recursive level.

Following command download really package wget and curl with recursivity (max 2 levels) in shared folder $PWD/volumes/packages. Container will be deleted after process.

```bash
docker run -d --name rpm-downloader_1 -v $PWD/volumes/packages:/packages -e RPM_LIST="wget curl" -e RECURSIVE_MODE=true -e RECURSIVE_MAX_LEVEL=2 --rm pamtrak06/centos7-rpm-downloader

.
|-- curl
|   |-- curl-7.29.0-42.el7_4.1.x86_64.rpm
|   `-- deps
|       |-- libcurl-0:7.29.0-42.el7.x86_64
|       |   `-- libcurl-7.29.0-42.el7.x86_64.rpm
|       |-- libcurl-0:7.29.0-42.el7_4.1.i686
|       |   `-- libcurl-7.29.0-42.el7_4.1.i686.rpm
|       |-- nspr-0:4.13.1-1.0.el7_3.x86_64
|       |   `-- nspr-4.13.1-1.0.el7_3.x86_64.rpm
|       |-- nss-0:3.28.4-8.el7.x86_64
|       |   `-- nss-3.28.4-8.el7.x86_64.rpm
|       `-- nss-util-0:3.28.4-3.el7.x86_64
|           `-- nss-util-3.28.4-3.el7.x86_64.rpm
|-- tree.log
`-- wget
    |-- deps
    |   |-- bash-0:4.2.46-29.el7_4.x86_64
    |   |   `-- bash-4.2.46-29.el7_4.x86_64.rpm
    |   |-- glibc-0:2.17-196.el7.x86_64
    |   |   `-- glibc-2.17-196.el7.x86_64.rpm
    |   |-- glibc-0:2.17-196.el7_4.2.i686
    |   |   `-- glibc-2.17-196.el7_4.2.i686.rpm
    |   |-- info-0:5.1-4.el7.x86_64
    |   |   `-- info-5.1-4.el7.x86_64.rpm
    |   |-- libidn-0:1.28-4.el7.x86_64
    |   |   `-- libidn-1.28-4.el7.x86_64.rpm
    |   |-- libuuid-0:2.23.2-43.el7_4.2.x86_64
    |   |   `-- libuuid-2.23.2-43.el7_4.2.x86_64.rpm
    |   |-- openssl-libs-1:1.0.2k-8.el7.x86_64
    |   |   `-- openssl-libs-1.0.2k-8.el7.x86_64.rpm
    |   |-- pcre-0:8.32-17.el7.x86_64
    |   |   `-- pcre-8.32-17.el7.x86_64.rpm
    |   `-- zlib-0:1.2.7-17.el7.x86_64
    |       `-- zlib-1.2.7-17.el7.x86_64.rpm
    `-- wget-1.14-15.el7_4.1.x86_64.rpm

18 directories, 17 files
```

## Configuration

Following environment variables re available :
- RPM_LIST, default empty, list of package to be downloaded, possible values : <package names list> 
- RECURSIVE_MODE: allow recursive mode to retrieve dependencies of a package, default not set, possible value : true
- RECURSIVE_MAX_LEVEL=1, max level for the recursive process, default to 1 dependency level
- YUMDOWNLOADER_OPTIONS="", [yum downloader options](https://github.com/rpm-software-management/yum-utils/blob/master/yumdownloader.py), default empty, possible values : --destdir, --urls, --resolve, --source, --archlist
- TRACE_ONLY_MODE, default not set,  debug mode to show result without really download package, possible value : true
