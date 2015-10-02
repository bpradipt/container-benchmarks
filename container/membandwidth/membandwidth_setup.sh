#!/bin/bash

d_path=${1}
DOWNLOAD_PATH=${d_path:-/membandwidth-bench}

rm -fr ${DOWNLOAD_PATH}

git clone https://github.com/bpradipt/mbw.git ${DOWNLOAD_PATH}
cd ${DOWNLOAD_PATH}
make install
