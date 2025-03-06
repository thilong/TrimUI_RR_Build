# RetroArch compile things
Files for compiling retroarch for trimui brick.

## setup env
This is just my environment using wsl , you can make your own one.

1. Install wsl on windows.
2. Install ubuntu 20.04 in wsl.
3. Install packages in ubuntu:   auto-config, make
     Don't install build-essential or gcc, file searching is complex and error occurs while comiple the source.
4. Download Trimui Smart Pro toolchain and sdk from [toolchain_sdk_smartpro](https://github.com/trimui/toolchain_sdk_smartpro)
5. Decompress the sdks to your disk . Mine is : /mnt/d/Library/Trimui/SDK

## Compile

1. Clone retroarch from [libretro respons](https://github.com/libretro/retroarch)
2. Put build_rr.sh and Makefile.trimui_brick into the root of retroarch respons folder.
3. Modify the line 9 of build_rr.sh , set TRIMUI_SDK_ROOT with your sdk path.
4. Make some patchs to let our mod-retroarch to read the assets files provided by trimui team.

   RetroArch use a default path with a prefix ".config" on linux. But the trimui one use ".retroarch".
   Modify "./config/retroarch" to ".retroarch" in the following files. 
    ```
    # platform_unix.c:1741    strlcpy(base_path + _len, "/.config/retroarch", sizeof(base_path) - _len);
    # file_path_special.c:179    ".config/retroarch/", len);
    ```
5. Execute " bash ./build_rr.sh" in terminal.

## How to use

The "retroarch" is the file I compiled, you can use it directly.

1. Push the output file "retroarch" to /mnt/SDCARD/RetroArch
2. Push the retroarch.cfg to /mnt/SDCARD/RetroArch/.retroarch/retroarch.cfg
3. Launch retroarch with trimui libs. Please check LD_LIBRARY_PATH export in launch.sh.

## Changes

1. New retroarch use .retroarch/retroarch.cfg as configuration file path while the trimui on use ./retroarch.cfg.
2. New retroarch now can use "glui" menu driver.
3. No vulkan video driver. ( No vulkan library in sdk to link...)
4. No Trimui menu
