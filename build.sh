#! /usr/bin/env bash

export PLAYDATE_SDK_PATH="/home/maurice/PlaydateSDK"
export NAME="GUTWOUND"
if [ -e ./build ]; then
  rm -d -r ./build
fi
mkdir build

pdc -I ./source/main.lua ./build/$NAME
