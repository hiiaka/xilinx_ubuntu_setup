#!/bin/sh

UHOME=$(pwd)
MNTDEV=/dev/sda2
MNTDIR=/mnt

sudo mount ${MNTDEV} ${MNTDIR}

cd ${MNTDIR}
echo ${UHOME}
sudo cp ${UHOME}/ubuntu_chroot.sh .
sudo wget http://cdimage.ubuntu.com/ubuntu-base/releases/20.04/release/ubuntu-base-20.04.2-base-arm64.tar.gz
sudo tar xf ubuntu-base-20.04.2-base-arm64.tar.gz
sudo rm ubuntu-base-20.04.2-base-arm64.tar.gz
sudo sync
cd ${UHOME}

sudo cp -av /usr/bin/qemu-aarch64-static ${MNTDIR}/usr/bin/
sudo cp -av /run/systemd/resolve/stub-resolv.conf ${MNTDIR}/etc/resolv.conf
sudo mount --bind /dev/  ${MNTDIR}/dev
sudo mount --bind /proc/ ${MNTDIR}/proc
sudo mount --bind /sys/  ${MNTDIR}/sys
sudo chroot ${MNTDIR} bash ./ubuntu_chroot.sh

sudo umount  ${MNTDIR}/dev
sudo umount  ${MNTDIR}/proc
sudo umount  ${MNTDIR}/sys
sudo rm ${MNTDIR}/ubuntu_chroot.sh
cd ${UHOME}
sudo sync
sudo umount  ${MNTDIR}


