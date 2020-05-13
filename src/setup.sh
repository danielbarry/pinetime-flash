#!/bin/bash

sudo apt-get install \
  autoconf           \
  libtool            \
  libhidapi-dev      \
  libusb-1.0-0       \
  libusb-1.0-0-dev   \
  pkg-config

cd openocd-spi
  ./bootstrap
  # Build based on host device
  case "$PT_DEVICE" in
    RPI3)
      ./configure --enable-sysfsgpio --enable-bcm2835spi --enable-cmsis-dap
      ;;
    OPIZ)
      ./configure --enable-sysfsgpio --enable-opizerospi --enable-cmsis-dap
      ;;
    *)
      echo "[!!] Unknown device '$PT_DEVICE'"
      ./configure
  esac
  make
cd ..
