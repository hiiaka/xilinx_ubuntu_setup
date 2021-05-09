#!/bin/sh -ea
PETAROOT=/usr/tools/xilinx/Petalinux/2020.2
source ${PETAROOT}/settings.sh

# Create Project
petalinux-create -t project -s bsp/avnet-digilent-zedboard-v2020.2-final.bsp --force

# Configure Petalinux
cd avnet-digilent-zedboard-2020.2
petalinux-config 

# Build Petalinux
petalinux-build

# Create Boot image
petalinux-package --boot --fsbl images/linux/zynq_fsbl.elf  --u-boot --force
