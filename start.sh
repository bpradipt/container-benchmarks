#!/bin/bash
#Run the supervisord program as well as the benchmarks
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
/benchmarks/container_benchmark_run.sh "$@"
#This will ensure container doesn't exits after execution of the benchmarks
/bin/bash

