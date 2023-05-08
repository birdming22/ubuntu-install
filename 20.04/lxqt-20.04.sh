#!/bin/bash

LXDE=" lxde lxqt xinit lxsession lightdm fonts-inconsolata xrdp xorgxrdp"
UTIL=" tmux git tig subversion openssh-server aptitude ntp"
CHINESE=" ttf-wqy-microhei ttf-wqy-zenhei xfonts-wqy fonts-inconsolata ibus ibus-chewing"
DEV=" ddd"
PACKAGE_LIST=""
PACKAGE_LIST+=$LXDE
PACKAGE_LIST+=$UTIL
PACKAGE_LIST+=$CHINESE
PACKAGE_LIST+=$DEV

sed 's@\/archive.ubuntu.com@\/tw.archive.ubuntu.com@' -i /etc/apt/sources.list
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

cp tmux.conf ~/.tmux.conf
cp xsession ~/.xsession
