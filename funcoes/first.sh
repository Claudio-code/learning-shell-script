#!/bin/bash

# shellcheck disable=SC2068

LISTA_DE_PPA=(
  libratbag-piper-libratbag-git
  lutris-team/lutris
)

URL_DOWNLOAD_CHROME="https://dl.google.com/linux/google-chrome-stable_current_amd64.deb"
URL_DOWNLOAD_SIMPLENOTE="https://github.com/Automattic/simplenote-electron/releases/downloads/v1.8.0/Simplenote-linux-1.8.0-amd64.deb"

FILE_DESTINY="/home/$USER/Downloads/programas"

PROGRAMAS_PARA_INSTALAR_SNAPS=(
  spotify
)

PROGRAMAS_PARA_INSTALAR_APT=(
  snapd
  winff
  guvcview
  virtualbox
)

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

mostrar_mensagem () {
  local mensagem="$1"

  echo "${mensagem}"
}

adicionar_ppas () {
  for ppa in ${LISTA_DE_PPA[@]}; do
    if ! grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep $ppa; then
      sudo apt-add-repository "ppa:$ppa" -y
    else
      mostrar_mensagem "o ppa $ppa já foi instalado."
    fi
  done
}

baixar_pacotes_deb () {
  if [[ ! -d "$FILE_DESTINY" ]]; then
    mkdir "$FILE_DESTINY"
  fi

  wget $URL_DOWNLOAD_CHROME     -P "$FILE_DESTINY"
  wget $URL_DOWNLOAD_SIMPLENOTE -P "$FILE_DESTINY"
}

instalar_pacotes_debs () {
  sudo dpkg -i "$FILE_DESTINY/*.deb"
  sudo apt -f install -y
}

instalar_pacotes_apt () {
  for programa in ${PROGRAMAS_PARA_INSTALAR_APT[@]}; do
    if ! dpkg -l | grep -q $programa; then
      sudo apt install $programa -y
    else
      mostrar_mensagem "o programa $programa já foi instalado."
    fi
  done
}

instalar_pacotes_snaps () {
  for programa in ${PROGRAMAS_PARA_INSTALAR_SNAPS[@]}; do
    if ! snap list | grep $programa; then
      sudo snap install $programa -y
    else
      mostrar_mensagem "o programa $programa já foi instalado."
    fi
  done
}

atualizar_e_limpar_sistema () {
  sudo apt dist-upgrade -y
  sudo autoclean
  sudo apt autoremove -y
}

remover_locks
adicionar_arquitetura_i386
adicionar_ppas
baixar_pacotes_deb
instalar_pacotes_debs
instalar_pacotes_apt
instalar_pacotes_snaps
atualizar_e_limpar_sistema
