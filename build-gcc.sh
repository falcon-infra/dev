#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive
apt install -y texinfo flex bison libgmp3-dev libmpfr-dev libmpc-dev file

GCC_VERSION=14.2.0
cd && wget https://mirrors.nav.ro/gnu/gcc/gcc-$GCC_VERSION/gcc-$GCC_VERSION.tar.gz
tar zxvf gcc-$GCC_VERSION.tar.gz
cd gcc-$GCC_VERSION
./contrib/download_prerequisites
mkdir build && cd build
../configure -v \
    --enable-checking=release \
    --enable-languages=c,c++ \
    --disable-multilib \
    --disable-bootstrap
make -j10 && make install

# set default gcc 14.2.0 /usr/local/bin/gcc
update-alternatives --install /usr/bin/gcc gcc /usr/local/bin/gcc 60 --slave /usr/bin/g++ g++ /usr/local/bin/g++
update-alternatives --set gcc /usr/local/bin/gcc

# clear
cd && rm -rf gcc-*
