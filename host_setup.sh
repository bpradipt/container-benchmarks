#!/bin/bash
#Prep the host environment for benchmark runs
#This is required for both SUT and initiator system

#Install docker either from distro repo or custom built as per requirement

#Install required packages
apt-get update -y
apt-get install -y apt-utils net-tools bzip2\
	git gcc wget apache2-utils \
	ltrace blktrace perf-tools-unstable \
	iotop dstat nmon strace sysstat


#Install lpcpu - http://ibm.co/download-lpcpu
mkdir -p /lpcpu-install
cd /lpcpu-install
wget https://www.ibm.com/developerworks/community/wikis/form/anonymous/api/wiki/26579cc3-66fe-42b8-baf9-1fcc88445848/page/4a7d2717-05c8-4b78-886e-5e4f9fdf07c1/attachment/7018590b-7fbe-4852-8d44-79af2d83fffa/media/lpcpu.tar.bz2
tar jxvf lpcpu.tar.bz2

#Install netserver
ARCH=`uname -m`
wget ftp://ftp.netperf.org/netperf/netperf-2.7.0.tar.bz2
tar jxvf netperf-2.7.0.tar.bz2
cd netperf-2.7.0
if [ "${ARCH}" == "ppc64le" ]
then
    curl -o config.sub 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD'
    curl -o config.guess 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD'
fi

./configure
make
make install

