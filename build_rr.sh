#!/bin/bash

# wsl -d Ubuntu-20.04
# adb push ./retroarch /mnt/SDCARD/RetroArch/

# platform_unix.c:1741    strlcpy(base_path + _len, "/.config/retroarch", sizeof(base_path) - _len);
# file_path_special.c:179    ".config/retroarch/", len);

export TRIMUI_SDK_ROOT=/mnt/d/Library/Trimui/SDK
export TRIMUI_TOOCHAIN_PATH=$TRIMUI_SDK_ROOT/aarch64-linux-gnu-7.5.0-linaro

export CC=$TRIMUI_TOOCHAIN_PATH/bin/aarch64-linux-gnu-gcc
export CXX=$TRIMUI_TOOCHAIN_PATH/bin/aarch64-linux-gnu-g++
export LD=$TRIMUI_TOOCHAIN_PATH/bin/aarch64-linux-gnu-ld
export AR=$TRIMUI_TOOCHAIN_PATH/bin/aarch64-linux-gnu-ar
export AS=$TRIMUI_TOOCHAIN_PATH/bin/aarch64-linux-gnu-as
export STRIP=$TRIMUI_TOOCHAIN_PATH/bin/aarch64-linux-gnu-strip

export PKG_CONFIG_PATH=$TRIMUI_SDK_ROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
export LDFLAGS=" -L$TRIMUI_SDK_ROOT/usr/lib"
export DATA_DIR="."

export EXT_CFLAGS=" -I$TRIMUI_SDK_ROOT/usr/include  -I$TRIMUI_SDK_ROOT/usr/include/SDL2 -I$TRIMUI_SDK_ROOT/usr/include/freetype2 " 

CFLAGS="-Ofast -march=armv8-a -mtune=cortex-a53 -fomit-frame-pointer -DNDEBUG -DUDEV_TOUCH_SUPPORT  $EXT_CFLAGS"\
    ./configure \
    --disable-caca \
    --disable-mali_fbdev \
    --disable-opengl \
    --disable-opengl_core \
    --disable-opengl1 \
    --disable-qt \
    --disable-vg \
    --disable-vulkan_display \
    --disable-wayland \
    --disable-x11 \
    --disable-vulkan \
    --disable-xrandr \
    --disable-winrawinput \
    --disable-gdi \
    --disable-d3d10 \
    --disable-d3d11 \
    --disable-d3d12 \
    --disable-opengl1 \
    --disable-microphone \
    --disable-kms \
    --disable-odroidgo2 \
    --disable-builtinzlib \
    --disable-v4l2 \
    --enable-sdl2 \
    --enable-alsa \
    --enable-egl \
    --enable-freetype \
    --enable-networking \
    --enable-opengles \
    --enable-ozone \
    --enable-udev \
    --enable-wifi

echo "building --------------------------------------------------------------"

make -j12 -f Makefile.trimui_brick