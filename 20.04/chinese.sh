#!/bin/bash

sudo apt update

# ref. check-language-support -l zh-hant
sudo apt install -y firefox-locale-zh-hant fonts-arphic-ukai \
    fonts-arphic-uming ibus-chewing ibus-table-cangjie3 \
    ibus-table-cangjie5 ibus-table-quick-classic language-pack-gnome-zh-hant \
    language-pack-zh-hant libreoffice-help-zh-tw libreoffice-l10n-zh-tw \
    thunderbird-locale-zh-hant thunderbird-locale-zh-tw

# generate locale
sudo locale-gen zh_TW.UTF-8

# start ibus daemon
im-config -n ibus
#pkill ibus-daemon
#ibus-daemon -d

# ibus setting for chewing
sudo apt install libglib2.0-bin
gsettings set org.freedesktop.ibus.general preload-engines "['xkb:us::eng', 'chewing']"
gsettings set org.freedesktop.ibus.general.hotkey triggers "['<Control>space']"

