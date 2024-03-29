# for auto update
cp 20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades
# for ls
cp dircolors ~/.dircolors
# timezone
timedatectl set-timezone Asia/Taipei
# for tig
cp tigrc ~/.tigrc
# disable screen saver
sed -i 's/mode\:\t\trandom/mode\:\t\toff/g' ~/.xscreensaver
gsettings set org.gnome.desktop.screensaver lock-delay 3600
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.screensaver idle-activation-enabled false

# disable suspend
systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
