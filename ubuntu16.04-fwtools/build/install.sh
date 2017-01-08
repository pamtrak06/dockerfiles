#!/bin/sh

cd `dirname $0`
if [ ! -d pymod ] ; then
  echo "Please run install.sh within the FWTools directory." 
  exit 1
fi

FWTOOLS_HOME=`pwd`

rm -f bin/*.pyo bin/*.pyc
rm -f bin/invproj bin/invgeod
(cd bin; ln -s proj invproj; ln -s geod invgeod)

for file in fwtools_env.sh fwtools_env.csh ; do 
  rm -f $file
  sed "/@FWTOOLS_HOME@/s#@FWTOOLS_HOME@#$FWTOOLS_HOME#" \
       conf/${file}.in > $file
done

rm -rf bin_safe
mkdir bin_safe

for file in bin/* ; do

  BASE=`basename $file`
   
  sed "/@FWTOOLS_HOME@/s#@FWTOOLS_HOME@#$FWTOOLS_HOME#" \
       conf/env_cover.sh.in > bin_safe/$BASE
  chmod a+x bin_safe/$BASE
done

/usr/bin/python -O lib/python2.2/compileall.py pymod lib/python2.2 bin tools


