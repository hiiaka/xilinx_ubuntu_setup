#!/bin/sh

useradd -G sudo -m -s /bin/bash fpga
echo fpga:fpga | chpasswd
apt update 
apt -y upgrade 
apt -y install locales tzdata \
  dialog perl \
  sudo ifupdown net-tools ethtool udev iputils-ping resolvconf wget apt-utils man devmem2 vim zsh \
  kmod openssh-client openssh-server \
  build-essential cmake git \
  python3 python3-dev python3-pip \

echo "auto lo" >> /etc/network/interfaces
echo "iface lo inet loopback" >> /etc/network/interfaces
echo "" >>  /etc/network/interfaces
echo "auto eth0" >>  /etc/network/interfaces
echo "iface eth0 inet dhcp" >>  /etc/network/interfaces

exit
