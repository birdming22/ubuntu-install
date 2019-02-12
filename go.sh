#!/bin/bash

GO="golang"
PACKAGE_LIST=""
PACKAGE_LIST+=$GO

apt-get update

for pkg in $PACKAGE_LIST; do
  #if dpkg --get-selections | grep -q "^$pkg[[:space:]]*install$"; then
  PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $pkg |grep "install ok installed")
  if [ "" == "$PKG_OK" ]; then
    apt-get -y install $pkg
  else
    echo $pkg installed
  fi
done

