#! /usr/bin/env bash

export PLAYDATE_SDK_PATH="/home/maurice/PlaydateSDK"
export NAME="GUTWOUND"
export OUT_DIR="./build/$NAME"


if [ -e ./build ]; then
  rm -d -r ./build
fi

mkdir build

pdc ./source/main.lua $OUT_DIR

PlaydateSimulator $OUT_DIR/$NAME.pdx/
