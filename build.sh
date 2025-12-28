#! /usr/bin/env bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  export PLAYDATE_SDK_PATH="$HOME/Developer/PlaydateSDK"
else
  export PLAYDATE_SDK_PATH="$HOME/PlaydateSDK"
fi
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
if [[ "$OSTYPE" == "darwin"* ]]; then
  open ./$NAME.pdx/
else
  PlaydateSimulator ./$NAME.pdx/
fi
