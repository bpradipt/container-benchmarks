#!/bin/bash

d_path=${1}
DOWNLOAD_PATH=${d_path:-/netperf}
ARCH=`uname -m`

rm -fr ${DOWNLOAD_PATH}
mkdir -p ${DOWNLOAD_PATH}
cd ${DOWNLOAD_PATH}

wget ftp://ftp.netperf.org/netperf/netperf-2.7.0.tar.bz2
tar jxvf netperf-2.7.0.tar.bz2
cd netperf-2.7.0
if [ "${ARCH}" == "ppc64le" ]
then
    curl -o config.sub 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD'
    curl -o config.guess 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD'
fi

./configure
make
make install

