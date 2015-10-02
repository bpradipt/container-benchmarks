#!/bin/bash

d_path=$1
DOWNLOAD_PATH=${d_path:-/stream-bench}

rm -fr ${DOWNLOAD_PATH}

git clone https://github.com/bpradipt/NUMA-STREAM.git ${DOWNLOAD_PATH}
cd ${DOWNLOAD_PATH}

#Number of threads equal to number of cores
OMP_NUM_THREADS=$(grep "processor" /proc/cpuinfo | wc -l)

export ${OMP_NUM_THREADS}
gcc -O3 -fopenmp -DN=80000000 -DNTIMES=100 stream.c -o stream -lnuma

cp stream /usr/bin
