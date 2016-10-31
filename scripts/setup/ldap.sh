#!/bin/sh

# Setup config
cp -vr /tmp/openldap /usr/local

# Check config
env LD_LIBRARY_PATH=/usr/local/bdb5/lib /usr/local/openldap/sbin/slaptest -u

# Start OpenLDAP server
env LD_LIBRARY_PATH=/usr/local/bdb5/lib /usr/local/openldap/libexec/slapd &

# Add entries
/usr/local/openldap/bin/ldapadd -f /tmp/entries.ldif -x -D "cn=Manager,c=gb" -w secret
