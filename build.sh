#! /usr/bin/env bash

export PLAYDATE_SDK_PATH="$HOME/PlaydateSDK"
export NAME="GUTWOUND"
export OUT_DIR="./build/$NAME"


if [ -e ./build ]; then
  rm -d -r ./build
fi
mkdir build

#Compile from main.lua
pdc -I $PLAYDATE_SDK_PATH ./source/main.lua $OUT_DIR

# So I don't have to clean up the pointless folders the simulator creates I cd into the build folder that'll get deleted anyways.
cd build
PlaydateSimulator ./$NAME.pdx/
