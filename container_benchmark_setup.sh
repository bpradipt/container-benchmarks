#!/bin/bash
#container_benchmark_setup.sh


TESTCASES=`ls -d container/*/*setup.sh`
for testcase in ${TESTCASES}
do
    ./${testcase}
done

