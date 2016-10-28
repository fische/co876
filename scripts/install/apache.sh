#!/bin/sh

# Retrieve dependencies
apt-get -y install g++

# Retrieve pcre sources
wget -O /tmp/pcre.tar.gz ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.38.tar.gz
tar -xzf /tmp/pcre.tar.gz -C /tmp

# Install pcre
cd /tmp/pcre-8.38
./configure --prefix=/usr/local/pcre
make
make install

# Retrieve httpd sources
wget -O /tmp/httpd.tar.gz http://mirror.catn.com/pub/apache//httpd/httpd-2.4.23.tar.gz
tar -xzf /tmp/httpd.tar.gz -C /tmp

# Retrieve apr sources and put it in srclib directory of httpd
wget -O /tmp/apr.tar.gz http://www.mirrorservice.org/sites/ftp.apache.org//apr/apr-1.5.2.tar.gz
tar -xzf /tmp/apr.tar.gz -C /tmp
mv /tmp/apr-1.5.2 /tmp/httpd-2.4.23/srclib/apr

# Retrieve apr-util sources and put it in srclib directory of httpd
wget -O /tmp/apr-util.tar.gz http://www.mirrorservice.org/sites/ftp.apache.org//apr/apr-util-1.5.4.tar.gz
tar -xzf /tmp/apr-util.tar.gz -C /tmp
mv /tmp/apr-util-1.5.4 /tmp/httpd-2.4.23/srclib/apr-util

# Install httpd
cd /tmp/httpd-2.4.23
./configure --prefix=/usr/local/apache2 --with-included-apr --with-pcre=/usr/local/pcre
make
make install
