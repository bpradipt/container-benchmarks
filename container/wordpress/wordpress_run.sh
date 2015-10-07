#!/bin/bash

t=1
while ! nc -z localhost 80
do
  sleep 1
  t=$((t+1))
done

echo "Waiting time for Apache to start (secs): $t"
echo -en "GET / HTTP/1.0\n\n\n"|nc localhost 80
