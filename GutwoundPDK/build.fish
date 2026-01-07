#!/usr/bin/env fish

# Set ARM toolchain paths for Linux
set -x ARM_NONE_EABI_GCC_PATH /usr/lib/gcc/arm-none-eabi/15
set -x ARM_NONE_EABI_SYSROOT_PATH /usr/arm-none-eabi

function cleanup
    pkill -f PlaydateSimulator 2>/dev/null
end

trap cleanup EXIT

cd ..
swift package pdc

# Create a symbolic link to the compiled pdx in the Playdate Simulator Games dir
# This allows browsing the pdx as a sideloaded game, helpful for checking icons
if test -L $PLAYDATE_SDK_PATH/Disk/Games/$PRODUCT_NAME.pdx
    rm -rf $PLAYDATE_SDK_PATH/Disk/Games/$PRODUCT_NAME.pdx
end
ln -s (pwd)/.build/plugins/PDCPlugin/outputs/$PRODUCT_NAME.pdx $PLAYDATE_SDK_PATH/Disk/Games/$PRODUCT_NAME.pdx

$PLAYDATE_SDK_PATH/bin/PlaydateSimulator $PLAYDATE_SDK_PATH/Disk/Games/$PRODUCT_NAME.pdx
