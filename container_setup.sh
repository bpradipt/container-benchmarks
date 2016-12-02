#!/bin/bash
#Prepare container for running the benchmarks

ARCH=$(uname -p)

if [[ "$ARCH" == "ppc64le" ]];then
	docker build -t benchmark/execution --rm=true -f Dockerfile.ppc64le .
else
	docker build -t benchmark/execution --rm=true .
fi
