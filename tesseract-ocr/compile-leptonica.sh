#!/bin/bash

cd ${LEPT_SRC_DIR}

# Install dependencies
sudo apt-get install -y g++  \
   autoconf automake libtool \
   autoconf-archive \
   pkg-config \
   libpng-dev \
   libjpeg8-dev \
   libtiff5-dev \
   zlib1g-dev \
   libicu-dev \
   libpango1.0-dev \
   libcairo2-dev

# Configure
./autobuild
./configure

# Compile
make

# Install
sudo make install
