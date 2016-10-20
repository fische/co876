#!/bin/sh

# Update depdendencies
apt-get -y update
apt-get -y install facter linux-headers-$(uname -r) build-essential zlib1g-dev libssl-dev libreadline-gplv2-dev curl unzip g++
