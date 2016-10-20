#!/bin/bash

# Clean pcre and httpd sources
rm -rf /tmp/pcre-8.38
rm -rf /tmp/httpd-2.4.23

# Clean apt-get cache
apt-get clean

# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Sync to ensure that the delete completes before this moves on.
sync
sync
sync
