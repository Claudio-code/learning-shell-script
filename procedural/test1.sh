#!/bin/bash

PPA_LIBRATBAG="ppa:libratbag-piper-libratbag-git"
PPA_LUTRIS="ppa:lutris-team/lutris"

URL_DOWNLOAD_CHROME="https://dl.google.com/linux/google-chrome-stable_current_amd64.deb"
URL_DOWNLOAD_SIMPLENOTE="https://github.com/Automattic/simplenote-electron/releases/downloads/v1.8.0/Simplenote-linux-1.8.0-amd64.deb"

FILE_DESTINY="/home/$USER/Downloads/programas"

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock
sudo dpkg --add-architecture i386
sudo apt update -y
sudo apt-add-repository "$PPA_LIBRATBAG" -y
sudo add-apt-repository "$PPA_LUTRIS" -y
sudo apt update -y
mkdir "$FILE_DESTINY"
wget $URL_DOWNLOAD_CHROME     -P "$FILE_DESTINY"
wget $URL_DOWNLOAD_SIMPLENOTE -P "$FILE_DESTINY"
sudo dpkg -i "$FILE_DESTINY/*.deb"
sudo apt -f install -y
sudo apt install snapd -y
sudo apt install winff -y
sudo apt install guvcview -y
sudo apt install virtualbox -y
sudo snap install spotify
sudo apt update && sudo apt dist-upgrade -y
sudo autoclean
sudo apt autoremove -y
