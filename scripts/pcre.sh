#!/bin/sh

# Retrieve pcre sources
wget -O /tmp/pcre.tar.gz ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.38.tar.gz
tar -xzf /tmp/pcre.tar.gz -C /tmp

# Install pcre
cd /tmp/pcre-8.38
./configure --prefix=/usr/local/pcre
make
make install
