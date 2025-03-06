#!/bin/sh
echo $0 $*
progdir=/mnt/SDCARD/Apps/BootRetroArch
trimuilib=/usr/trimui/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$progdir
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$trimuilib
#HOME=progdir $progdir/retroarch -v

RA_DIR=/mnt/SDCARD/RetroArch
cd $RA_DIR/

HOME=$RA_DIR/ $RA_DIR/retroarch -v
