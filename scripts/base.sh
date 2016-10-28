#!/bin/sh

apt-get -y update >/dev/null
apt-get -y install linux-headers-$(uname -r) build-essential curl >/dev/null
