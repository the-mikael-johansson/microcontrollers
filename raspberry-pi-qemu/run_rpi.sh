#!/bin/bash

# Note! The version combination of kernel, DTB and OS is important
export RPI_KERNEL=kernel-qemu-4.19.50-buster
export DTB_FILE=versatile-pb-buster-5.4.51.dtb
# Tested OS images
export OS_IMAGE=2020-02-13-raspbian-buster.img
export OS_IMAGE=2020-08-20-raspios-buster-armhf.img

qemu-system-arm \
-kernel $RPI_KERNEL \
-cpu arm1176 \
-m 256 \
-M versatilepb \
-dtb ${DTB_FILE} \
-serial stdio \
-append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" \
-drive "file=${OS_IMAGE},index=0,media=disk,format=raw" \
-net nic \
-net user,hostfwd=tcp::5022-:22 \
-no-reboot
