#!/bin/bash
#host_benchmark_setup.sh


TESTCASES=`ls -d host/*/*setup.sh`
for testcase in ${TESTCASES}
do
    ./${testcase}
done

