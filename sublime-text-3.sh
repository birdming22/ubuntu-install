#!/bin/bash
#
# for Ubuntu 16.04 & 18.04
#

SUBLIME="sublime-text"
PACKAGE_LIST=""
PACKAGE_LIST+=$SUBLIME

echo
echo "Sublime Text 2 will be REMOVED!!!"
read -p "press Ctrl-C to cancel or press enter to continue" -n 1
echo
apt-get -y purge $SUBLIME
mv /etc/apt/sources.list.d/*sublime-text-2* /tmp

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

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

