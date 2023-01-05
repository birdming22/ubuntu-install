#!/bin/bash

sudo apt-add-repository -y multiverse
sudo apt install curl
curl -1sLf 'https://dl.cloudsmith.io/public/asbru-cm/release/cfg/setup/bash.deb.sh' | sudo -E bash
sudo apt install asbru-cm
sudo apt install libglib2.0-dev cpanminus
sudo cpanm -i Glib
