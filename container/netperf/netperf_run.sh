#!/bin/bash
#From the container we'll be connecting to external netserver to avoid NAT issues
hname=${1}
pname=${2}
HOST=${hname:-localhost}
PORT=${pname:-12865}
#Latency
netperf -H ${HOST} -p ${PORT} -t TCP_RR

#Throughput
netperf -H ${HOST} -p  ${PORT} -t TCP_STREAM

#Add more

