#!/bin/bash
. /scripts/rpm_functions.sh
[ -z "$RPM_LIST" ] && \
  echo "WARNING: list of rpm must not be empty !" && \
  exit 1

rpm_download "$RPM_LIST" /packages 1
tree /packages > /packages/tree.log
