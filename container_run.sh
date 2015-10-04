#!/bin/bash
#benchmark_run.sh <host_ip>
#Host IP is the netserver IP which the container will connect to


#Best way is to run it with -net=host and provide a public IP to the container
#However we are currently running using the default docker bridge

IP=${1}
LOCAL_HOST_IP=`ip addr list eth0 |grep "inet " |cut -d' ' -f6|cut -d/ -f1`

HOST_IP=${LOCAL_HOST_IP:-$IP}
echo "Host IP for container to connect to ${HOST_IP}"
#wordpress port=80

CID=`docker run -itd -p 80 --hostname=benchmark.node benchmark/execution ${HOST_IP}`
CIP=`docker inspect -f '{{ .NetworkSettings.IPAddress }}' ${CID}`
echo "Container ID: ${CID} Container IP: ${CIP}"
echo "Container json logs are in /var/lib/docker/containers/${CID}/${CID}-json.log"
echo "Additionally container logs can be displayed using docker logs ${CID}"

