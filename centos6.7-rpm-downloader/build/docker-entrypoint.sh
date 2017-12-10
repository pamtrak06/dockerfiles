#!/bin/bash
. /scripts/rpm_functions.sh

if [ -n "$RPM_FILE" ]; then
  rpm_download_from_file "$RPM_FILE" /packages 1 "$RPM_FILE_ITEM_INDEX"
elif [ -n "$RPM_LIST" ]; then
  rpm_download_from_list "$RPM_LIST" /packages 1
else
  [ -z "$RPM_LIST" ] && \
    echo "WARNING: list of packages must not be empty !"
  [ -z "$RPM_FILE" ] && \
    echo "WARNING: file list of packages must not be empty !"
  exit 1
fi
tree /packages > /packages/tree.log
