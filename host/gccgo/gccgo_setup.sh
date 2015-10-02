#!/bin/bash
#Run GCC micro benchmarks on LE platform
#go_setup.sh [5|6] [download_path] [install_prefix]

ver=${1}
d_path=${2}
i_prefix=${3}

GCCVER=${ver:-5}
DOWNLOAD_PATH=${d_path:-/gcc-download}
INSTALL_PREFIX=${i_prefix:-/usr/local/gccgo}

rm -fr ${DOWNLOAD_PATH}
mkdir -p ${DOWNLOAD_PATH}
cd ${DOWNLOAD_PATH}


if [ "${GCCVER}" == "5" ]
then
    svn co svn://gcc.gnu.org/svn/gcc/branches/gcc-5-branch src
else
    svn co svn://gcc.gnu.org/svn/gcc/trunk src
fi

mkdir bld; cd bld
../src/configure --target=powerpc64le-linux --host=powerpc64le-linux \
    --build=powerpc64le-linux --enable-threads=posix --enable-shared \
    --enable-__cxa_atexit --enable-languages=c,c++,go --enable-secureplt \
    --enable-checking=yes --with-long-double-128 --enable-decimal-float \
    --disable-bootstrap --disable-alsa --disable-multilib --prefix=${INSTALL_PREFIX}

make -j4

make install

echo "export LD_LIBRARY_PATH=${INSTALL_PREFIX}/lib64:${LD_LIBRARY_PATH}" > /etc/profile.d/go.sh
echo "export PATH=${INSTALL_PREFIX}/bin:${PATH}" >> /etc/profile.d/go.sh
source /etc/profile.d/go.sh

