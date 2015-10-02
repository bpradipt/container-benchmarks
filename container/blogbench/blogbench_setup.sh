#!/bin/bash

d_path=${1}
DOWNLOAD_PATH=${d_path:-/blogbench}
ARCH=`uname -m`

rm -fr ${DOWNLOAD_PATH}
mkdir -p ${DOWNLOAD_PATH}
cd ${DOWNLOAD_PATH}
wget http://download.pureftpd.org/pub/blogbench/blogbench-1.1.tar.gz
tar xzvf blogbench-1.1.tar.gz
cd blogbench-1.1

if [ "${ARCH}" == "ppc64le" ]
then
    curl -o config.sub 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD'
    curl -o config.guess 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD'
fi

./configure
make
make install

