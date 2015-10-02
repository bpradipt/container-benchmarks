#!/bin/bash

timestamp=$(date "+%Y.%m.%d-%H.%M")

/opt/ltp/runltp -p -l /root/ltp_${timestamp}.log -f containers
