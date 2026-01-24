#!/usr/bin/env fish

# Set product name
set PRODUCT_NAME Gutwound

# Check if PLAYDATE_SDK_PATH is set
if not set -q PLAYDATE_SDK_PATH
    echo "Error: PLAYDATE_SDK_PATH environment variable is not set"
    echo "Please set it to your Playdate SDK installation directory"
    exit 1
end

if not test -d ./.builds
    mkdir .builds
end

if not test -L ./compile_commands.json
    xmake project -k compile_commands
end

echo "Building $PRODUCT_NAME.pdx..."
xmake build

if test $status -ne 0
    echo "Build failed!"
    exit 1
end

echo "Build successful!"

if test -L $PLAYDATE_SDK_PATH/Disk/Games/$PRODUCT_NAME.pdx
    rm -rf $PLAYDATE_SDK_PATH/Disk/Games/$PRODUCT_NAME.pdx
end
ln -s (pwd)/.builds/$PRODUCT_NAME.pdx $PLAYDATE_SDK_PATH/Disk/Games/$PRODUCT_NAME.pdx

cd .builds

$PDSIM ./$PRODUCT_NAME.pdx
