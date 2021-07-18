#!/bin/bash

# shellcheck disable=SC2068

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

FILE_DESTINY="/home/$USER/Downloads/programas"

LISTA_DE_PPA=(
  lutris-team/lutris
)

PROGRAMAS_PARA_INSTALAR_DEB=(
  https://dl.google.com/linux/google-chrome-stable_current_amd64.deb
  https://github.com/Automattic/simplenote-electron/releases/downloads/v1.8.0/Simplenote-linux-1.8.0-amd64.deb
)

PROGRAMAS_PARA_INSTALAR_SNAPS=(
  spotify
)

PROGRAMAS_PARA_INSTALAR_APT=(
  snapd
  winff
  guvcview
  virtualbox
  wget
)
  
verificando_conexao_com_internet () {
  if ! ping -c 1 8.8.8.8 -q &> /dev/null ; then
    echo "${RED}[ERROR]${NC} - seu pc está sem conexão com a internet."
    exit 1
  fi

  echo "${GREEN}[INFO]${NC} - seu pc está conectado a internet."
}

remover_locks () {
  echo "${GREEN}[INFO]${NC} - removendo locks do sistema."
  
  sudo rm /var/lib/dpkg/lock-frontend
  sudo rm /var/cache/apt/archives/lock
}

atualizar_repositorios () {
  echo "${GREEN}[INFO]${NC} - atualizando repositorios."

  sudo apt update -y &> /dev/null
}

adicionar_arquitetura_i386 () {
  echo "${GREEN}[INFO]${NC} - adicionada arquitetura 32 bits."

  sudo dpkg --add-architecture i386 &> /dev/null
  atualizar_repositorios
}

mostrar_mensagem () {
  local mensagem="$1"

  echo "${mensagem}"
}

adicionar_ppas () {
  echo "${GREEN} [INFO]${NC} - adicionando lista de ppas."

  for ppa in ${LISTA_DE_PPA[@]}; do
    if ! grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep $ppa; then
      sudo apt-add-repository "ppa:$ppa" -y &> /dev/null
    else
      mostrar_mensagem "${GREEN}[INFO]${NC} - o ppa $ppa já foi instalado."
    fi
  done
}

verificar_arquivo_baixado () {
  echo "${GREEN}[INFO]${NC} - verificando se os arquivos .deb ja foram baixados."

  local url="$1"
  local url_extraida=${echo ${url##*/} | sed 's/-/_/g' | cut -d _ -f 1}

  if ! dpkg -l | grep -iq $url_extraida; then
    wget -c "$url" -P "$FILE_DESTINY" &> /dev/null
    sudo dpkg -i "$FILE_DESTINY/${url##*}" &> /dev/null
  else
    mostrar_mensagem "${GREEN}[INFO]${NC} - O programa $url_extraida já foi instalado."
  fi
}

baixar_pacotes_deb () {
  echo "${GREEN}[INFO]${NC} - baixando pacotes .deb."
  [[ ! -d "$FILE_DESTINY" ]] && mkdir "$FILE_DESTINY"

  for url in ${PROGRAMAS_PARA_INSTALAR_DEB}; do
    verificar_arquivo_baixado "$url"
  done

  sudo apt -f install -y &> /dev/null
}

instalar_pacotes_apt () {
  echo "${GREEN}[INFO]${NC} - instalando programas do repositorio do ubuntu."
  
  for programa in ${PROGRAMAS_PARA_INSTALAR_APT[@]}; do
    if ! dpkg -l | grep -q $programa; then
      sudo apt install $programa -y &> /dev/null
    else
      mostrar_mensagem "${GREEN}[INFO]${NC} - o programa $programa já foi instalado."
    fi
  done
}

instalar_pacotes_snaps () {
  echo "${GREEN}[INFO]${NC} - baixando pacotes snaps."

  for programa in ${PROGRAMAS_PARA_INSTALAR_SNAPS[@]}; do
    if ! snap list | grep $programa; then
      sudo snap install $programa -y &> /dev/null
    else
      mostrar_mensagem "${GREEN}[INFO]${NC} - o programa $programa já foi instalado."
    fi
  done
}

atualizar_e_limpar_sistema () {
  echo "${GREEN}[INFO]${NC} - atualizando e limpando o sistema."

  sudo apt dist-upgrade -y &> /dev/null
  sudo autoclean &> /dev/null
  sudo apt autoremove -y &> /dev/null
}

verificando_conexao_com_internet \
&& remover_locks \
&& adicionar_arquitetura_i386 \
&& adicionar_ppas \
&& instalar_pacotes_apt \
&& baixar_pacotes_deb \
&& instalar_pacotes_snaps \
&& atualizar_e_limpar_sistema
