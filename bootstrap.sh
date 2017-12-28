#!/bin/bash

# ask for root permissions
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

# install common system tools
apt update -y
apt install -y \
  git \
  curl \
  wget \
  tar \
  bzip2 \
  gzip \
  less \
  ssh \
  openvpn

# install docker
apt install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg2 \
  software-properties-common

curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add -
add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
  $(lsb_release -cs) \
  stable"

apt update
apt install -y docker-ce

# install desktop environment
apt install -y \
  i3 \
  xorg \
  rofi

# install network manager
apt install -y \
  wicd
