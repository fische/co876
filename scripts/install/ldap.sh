#!/bin/sh

# Retrieve dependencies
apt-get -y install software-properties-common python-software-properties
add-apt-repository ppa:openjdk-r/ppa
apt-get -y update
apt-get -y install openjdk-8-jdk jxplorer

# Retrieve BerkeleyDB sources
wget -O /tmp/bdb.tar.gz http://download.oracle.com/berkeley-db/db-5.0.32.tar.gz
tar -xzf /tmp/bdb.tar.gz -C /tmp

# Install BerkeleyDB
cd /tmp/db-5.0.32/build_unix
../dist/configure --prefix=/usr/local/bdb5 --enable-cxx --enable-debug --enable-java
make
make install

# Retrieve OpenLDAP sources
wget -O /tmp/ldap.tar.gz http://mirror.eu.oneandone.net/software/openldap/openldap-release/openldap-2.4.44.tgz
tar -xzf /tmp/ldap.tar.gz -C /tmp

# Install OpenLDAP
cd /tmp/openldap-2.4.44
env CPPFLAGS=-I/usr/local/bdb5/include LDFLAGS=-L/usr/local/bdb5/lib LD_LIBRARY_PATH=/usr/local/bdb5/lib ./configure --prefix=/usr/local/openldap
make depend
make
make install
