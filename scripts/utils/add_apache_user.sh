#!/bin/sh

if [[ $USERNAME != "" ]] && [[ $PASSWORD != "" ]]; then
  mkdir -p /usr/local/apache2/passwd
  /usr/local/apache2/bin/htpasswd -b /usr/local/apache2/passwd/passwords $USERNAME $PASSWORD
fi
