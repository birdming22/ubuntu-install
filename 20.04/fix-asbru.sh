#!/bin/bash

sudo apt-add-repository -y multiverse
sudo apt install -y curl
curl -1sLf 'https://dl.cloudsmith.io/public/asbru-cm/release/cfg/setup/bash.deb.sh' | sudo -E bash
sudo apt install -y asbru-cm
sudo apt install -y libglib2.0-dev cpanminus
sudo cpanm -i Glib
