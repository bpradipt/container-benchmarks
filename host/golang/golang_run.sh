#!/bin/bash

d_path=${1}
DOWNLOAD_PATH=${d_path:-/go-bench}
  
rm -fr ${DOWNLOAD_PATH}

git clone https://go.googlesource.com/go ${DOWNLOAD_PATH}
cd ${DOWNLOAD_PATH}
cd test/bench/go1

go test -c

#Run the tests using only 1 proc. Use benchcmp for comparison
#golang.org/x/tools/cmd/benchcmp
GOMAXPROCS=1 ./go1.test -test.bench=. | tee output
