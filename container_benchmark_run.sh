#!/bin/bash
#This runs benchmark inside the container
#benchmark_run.sh 'all' or specific test case

test_dir=${1}
TESTS=${test_dir:-all}

if [ "${TESTS}" == "all" ]
then
    TESTCASES=`ls -d container/*/*run.sh`
else
    TESTCASES=`ls -d container/${TESTS}/*run.sh`
fi

for testcase in ${TESTCASES}
do
    TEST_NAME=$( dirname ${testcase} | sed 's/container\///g')
    echo "********************************************************************"
    echo "********************************************************************"
    echo "START Testcase: ${TEST_NAME}"
    echo "********************************************************************"
    echo "********************************************************************"
    ./${testcase}
    echo "********************************************************************"
    echo "********************************************************************"
    echo "END Testcase: ${TEST_NAME}"
    echo "********************************************************************"
    echo "********************************************************************"
done

