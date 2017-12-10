#!/bin/bash

# Local installation of rpm (no internet download) 
function rpm_local_install {
  local rpmpath=$1
  echo "INFO: yum install rpm from path $rpmpath..." 
  for rpm in $(find ${rpmpath} -name "*.rpm" -type f); do
    echo "INFO: install rpm: $rpm..."
    yum --disablerepo='*' --disableplugin='*' install -y $rpm
  done
}

# Local installation of rpm (no internet download) from a file list of rpm to respect order
function rpm_local_install_from_file {
    local rpmfile=$1
    local rpmpath=$2
    local itemidx=$3

    [ -z "$rpmpath" ] && rpmpath=$PWD
	[ -z "$itemidx" ] && itemidx=1

    if [ -n "$rpmfile" ]; then
      eval_string=$(echo "cat \$rpmfile|awk '{print \$$itemidx}'")
      for rpm in $(eval $eval_string); do
        echo "INFO: install rpm: $rpm..."
        rpmfile=$(find ${rpmpath} -name "$rpm" -type f)
        yum --disablerepo='*' --disableplugin='*' install -y $rpmfile
      done
    fi
}

function rpm_download {
  local rpm=$1
  local rpmpath=$2
  local level=$3

  echo "INFO: download package \"$rpm\" in path $rpmpath/$rpm..."
  [ ! -f "$rpmpath/$rpm" ] && mkdir -p $rpmpath/$rpm

  if [ -n "$RESOLVE_MODE" ]; then
    for dep in $(repoquery --requires --recursive --resolve $rpm); do
      yumdownloader $YUMDOWNLOADER_OPTIONS $dep --destdir=$rpmpath/$rpm
    done
  else
    [ -z "$TRACE_ONLY_MODE" ] && \
      yumdownloader $YUMDOWNLOADER_OPTIONS $rpm --destdir=$rpmpath/$rpm

    if [ -n "$RECURSIVE_MODE" ]; then
      [ $(($level)) -le $(($RECURSIVE_MAX_LEVEL)) ] && \
        echo "INFO: process level ($level)/($RECURSIVE_MAX_LEVEL)..."  && \
        rpm_download_dependencies $rpm $rpmpath/$rpm/dependencies $level
    fi
  fi

}

# Download rpm from file list
function rpm_download_from_file {
  local rpmfile=$1
  local rpmpath=$2
  local level=$3
  local itemidx=$4

  [ -z "$level" ] && level=1
  [ -z "$rpmpath" ] && rpmpath=$PWD
  [ -z "$itemidx" ] && itemidx=1
  
  if [ -n "$rpmfile" ]; then
    eval_string=$(echo "cat \$rpmfile|awk '{print \$$itemidx}'")
    for rpm in $(eval $eval_string); do
      rpm_download $rpm $rpmpath $level
    done
  fi

}

# Download rpm from varaible list
function rpm_download_from_list {
  local rpmlist=$1
  local rpmpath=$2
  local level=$3
  
  for rpm in $(echo $rpmlist); do
    rpm_download $rpm $rpmpath $level
  done
}

# Download rpm dependencies
function rpm_download_dependencies {
  local rpm=$1
  local rpmpath=$2
  local level=$(($3+1))
  [ $(($level)) -le $(($RECURSIVE_MAX_LEVEL)) ] && \
    for dep in $(repoquery --requires --resolve $rpm); do
      echo "INFO: process package dependency $dep..."
      echo "INFO: package identification for safe recursivity: \"$(find /packages -name "$dep" -type d)\""
      if [ -z "$(find /packages -name "$dep" -type d)" ]; then
        rpm_download $dep $rpmpath $level
      else
        echo -e "\tWARN: already downloaded"
      fi
    done
}


