#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	  echo -e "\033[31mYou must be a root user\033[0m" 2>&1
fi

rmmod ftdi_sio 2>/dev/null

MACHINE_TYPE=`uname -m`
if [[ $MACHINE_TYPE -eq 'x86_64' ]]; then
	  # 64-bit stuff here
		ARCH=64
else
		# 32-bit stuff here
		ARCH=86
fi

ln -sf x$ARCH/libftd2xx.so.1.3.6 libftd2xx.so.0 2>/dev/null
export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH


x$ARCH/avreal$ARCH-1.29r0 "$@"
