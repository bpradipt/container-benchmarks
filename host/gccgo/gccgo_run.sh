#!/bin/bash

d_path=${1}
DOWNLOAD_PATH=${d_path:-/go-bench}
  
rm -fr ${DOWNLOAD_PATH}

git clone https://go.googlesource.com/go ${DOWNLOAD_PATH}
cd ${DOWNLOAD_PATH}
cd go/test/bench

#shootout:  code generation performance tests.  
#They are compiled and run using the timing.sh script in the directory, using gccgo and gc.  
#It also has C versions of the programs and builds those with gcc for comparison.  Nice!

cd shootout

source /etc/profile.d/go.sh
./timing.sh > timing.log
