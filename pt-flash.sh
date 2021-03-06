#!/bin/bash

DEVICE[0]="RPI3"
DEVICE[1]="OPIZ"

TARGET[0]="PTDEV"

# check()
#
# Check that the dependencies for flashing exist and are setup correctly.
function check {
  bash src/check.sh
}

# device()
#
# Set the device to be used.
#
# @param $1 The current device type.
function device {
  bash src/device.sh $1
}

# dump()
#
# Dump the content of memory.
function dump {
  bash src/dump.sh
}

# erase()
#
# Erase the target device memory..
function erase {
  bash src/erase.sh
}

# flash()
#
# Flash the target device with an image.
#
# @param $1 The target memory location.
# @param $2 The binary image to flash.
function flash {
  bash src/flash.sh $1 $2
}

# display_help()
#
# Display help for this script.
function display_help {
  echo "./pt-flash.sh <CMD> [PARAMs]"
  echo ""
  echo "  CoMmanDs"
  echo ""
  echo "    check      Check dependencies"
  echo "    device     Set the device type <DEV>"
  echo "                 DEVice:"
  echo "                   ${DEVICE[0]}  Raspberry Pi 3"
  echo "                   ${DEVICE[1]}  Orange Pi Zero"
  echo "    dump       Dump the contents of memory"
  echo "    erase      Erase the device's currently memory"
  echo "    flash      Flash the device <LOC> <BIN>"
  echo "                 LOCation:"
  echo "                   BOOT  Write image to boot memory"
  echo "                   APP   Write image to application memory"
  echo "                 BINary: Location of image to be flashed"
  echo "    help       Display this help"
  echo "    protect    Toggle device protection <STATE>"
  echo "                 STATE:"
  echo "                   ON   Turn memory protection on"
  echo "                   OFF  Turn memory protection off"
  echo "    setup      Setup this flashing device"
  echo "    target     Set the target device <TARG>"
  echo "                 TARGet:"
  echo "                   ${TARGET[0]}  Pine Time v1 Dev"
}

# protect()
#
# Set the flash protection
#
# @param $1 Toggle the state of the flash protection.
function protect {
  bash src/protect.sh $1
}

# setup()
#
# Install the required software for flashing from this device.
function setup {
  bash src/setup.sh
}

# target()
#
# Set the flash target.
#
# @param $1 The target device to be flashed.
function target {
  bash src/target.sh $1
}

# main()
#
# Entry function into the script.
#
# @param $@ Command line arguments.
function main {
  # Make sure we at least have something
  if [ "$#" -le 0 ]; then
    echo "[!!] Please use 'help' for more info"
    # End early
    exit 1
  fi
  # Parse parameters
  case "$1" in
    check)
      check
      ;;
    device)
      device $2
      ;;
    dump)
      dump
      ;;
    erase)
      erase
      ;;
    flash)
      flash $2 $3
      ;;
    help)
      display_help
      ;;
    protect)
      protect $2
      ;;
    setup)
      setup
      ;;
    target)
      target $2
      ;;
    *)
      echo "[!!] Unknown command '$1', see 'help'"
      exit 1
  esac
  # We're done
  exit 0
}

main $@
