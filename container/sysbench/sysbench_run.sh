#!/bin/sh
#Runs cpu and fio tests.

SIZE_ARG=${1}
PRIME_ARG=${2}
#File size should be ideally more than RAM to avoid caching
SIZE=${SIZE_ARG:-6G}
PRIME=${PRIME_ARG:-20000}

sysbench --test=fileio --file-total-size=$SIZE prepare
sysbench --test=fileio --file-total-size=$SIZE --file-test-mode=rndrw \
         --init-rng=on --max-time=300 --max-requests=0 run
sysbench --test=fileio --file-total-size=$SIZE cleanup

sysbench --test=cpu --cpu-max-prime=${PRIME} run
