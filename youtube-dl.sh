#!/bin/bash

sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

# for extract mp3
sudo apt update
sudo apt install -y ffmpeg

# for upgrade
sudo youtube-dl -U
