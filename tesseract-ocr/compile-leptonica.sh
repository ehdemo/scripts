#!/bin/bash

cd ${LEPT_SRC_DIR}

# Configure
./autobuild
./configure

# Compile
make

# Install
sudo make install
