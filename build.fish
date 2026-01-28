#!/usr/bin/env fish

# Fixes an issue for Linux, or possibly specifically my gentoo install when when compiling, swift can't find my studio.h file.
if test (hostname) = eighthCircle
    set -x ARM_NONE_EABI_GCC_PATH /usr/lib/gcc/arm-none-eabi/15
    set -x ARM_NONE_EABI_SYSROOT_PATH /usr/arm-none-eabi
end

if test (hostname) = ninthCircle
    source ~/.config/fish/_9thCircle.fish
end

set PRODUCT_NAME Gutwound
set GAME_PATH $PLAYDATE_SDK_PATH/Disk/Games/$PRODUCT_NAME.pdx
# Use the development snapshot toolchain for Embedded Swift armv7em target support
set -x TOOLCHAINS swift

swift package pdc 2>&1 | grep -v "libtinfo.so.6: no version information" | grep -v "libxml2.so.2: no version information" | grep -v "libcurl.so.4: no version information"

if test -L $GAME_PATH
    rm -rf $GAME_PATH
end
ln -s (pwd)/.build/plugins/PDCPlugin/outputs/$PRODUCT_NAME.pdx $GAME_PATH

cd .build

$PDSIM $GAME_PATH
