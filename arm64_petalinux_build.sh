#!/bin/sh -ea
PETAROOT=/usr/tools/xilinx/Petalinux/2020.2
source ${PETAROOT}/settings.sh

# Create Project
petalinux-create -t project -s bsp/xilinx-zcu102-v2020.2-final.bsp --force

# Configure Petalinux
cd xilinx-zcu102-2020.2
petalinux-config 

# Build Petalinux
petalinux-build

# Create Boot image
petalinux-package --boot --fsbl images/linux/zynqmp_fsbl.elf  --u-boot --force

