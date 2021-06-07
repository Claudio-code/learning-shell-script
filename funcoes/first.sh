#!/bin/bash

PPA_LIBRATBAG="ppa:libratbag-piper-libratbag-git"
PPA_LUTRIS="ppa:lutris-team/lutris"

URL_DOWNLOAD_CHROME="https://dl.google.com/linux/google-chrome-stable_current_amd64.deb"
URL_DOWNLOAD_SIMPLENOTE="https://github.com/Automattic/simplenote-electron/releases/downloads/v1.8.0/Simplenote-linux-1.8.0-amd64.deb"

FILE_DESTINY="/home/$USER/Downloads/programas"

remover_locks () {
  sudo rm /var/lib/dpkg/lock-frontend
  sudo rm /var/cache/apt/archives/lock
}

atualizar_repositorios () {
  sudo apt update -y
}

adicionar_arquitetura_i386 () {
  sudo dpkg --add-architecture i386
  atualizar_repositorios
}

adicionar_ppas () {
  sudo apt-add-repository "$PPA_LIBRATBAG" -y
  sudo add-apt-repository "$PPA_LUTRIS" -y
  atualizar_repositorios
}

instalar_pacotes_debs () {
  if [[ ! -d "$FILE_DESTINY" ]]; then
    mkdir "$FILE_DESTINY"
  fi

  wget $URL_DOWNLOAD_CHROME     -P "$FILE_DESTINY"
  wget $URL_DOWNLOAD_SIMPLENOTE -P "$FILE_DESTINY"
  sudo dpkg -i "$FILE_DESTINY/*.deb"
  sudo apt -f install -y
}

instalar_pacotes_apt () {
  sudo apt install snapd -y
  sudo apt install winff -y
  sudo apt install guvcview -y
  sudo apt install virtualbox -y
}

instalar_pacotes_snaps () {
  sudo snap install spotify
}

atualizar_e_limpar_sistema () {
  sudo apt dist-upgrade -y
  sudo autoclean
  sudo apt autoremove -y
}

remover_locks
adicionar_arquitetura_i386
adicionar_ppas
instalar_pacotes_debs
instalar_pacotes_apt
instalar_pacotes_snaps
atualizar_e_limpar_sistema
