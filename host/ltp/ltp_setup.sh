#!/bin/bash
#This should be run on the host directly

d_path=${1}
DOWNLOAD_PATH=${d_path:-/ltp}

rm -fr ${DOWNLOAD_PATH}
mkdir -p ${DOWNLOAD_PATH}
cd ${DOWNLOAD_PATH}

wget http://downloads.sourceforge.net/project/ltp/LTP%20Source/ltp-20150420/ltp-full-20150420.tar.bz2
tar jxvf ltp-full-20150420.tar.bz2
cd ltp-full-20150420
./configure
make all
make install
