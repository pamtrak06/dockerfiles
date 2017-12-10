docker run -it --name rpm-downloader_1 -v $PWD/volumes/packages:/packages -e RPM_FILE=/packages/debug.log -e RPM_FILE_ITEM_INDEX=3 --rm pamtrak06/rpm-downloader:centos6.7 bash
