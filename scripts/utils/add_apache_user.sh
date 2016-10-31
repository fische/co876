#!/bin/sh

if [[ $LOGIN != "" ]] && [[ $PASSWORD != "" ]]; then
  mkdir -p /usr/local/apache2/passwd
  /usr/local/apache2/bin/htpasswd -b /usr/local/apache2/passwd/passwords $LOGIN $PASSWORD
fi
