#!/usr/bin/env fish

set PLAYDATE_SDK_PATH ~/Developer/PlaydateSDK
# Set product name
set PRODUCT_NAME Gutwound

if not test -d .playdate-luacats
    mkdir .playdate-luacats
    git clone https://github.com/notpeter/playdate-luacats.git ./.playdate-luacats/
end

function cleanup
    pkill -f PlaydateSimulator 2>/dev/null
end

trap cleanup EXIT

# Check if PLAYDATE_SDK_PATH is set
if not set -q PLAYDATE_SDK_PATH
    echo "Error: PLAYDATE_SDK_PATH environment variable is not set"
    echo "Please set it to your Playdate SDK installation directory"
    exit 1
end

if not test -d ./.builds
    mkdir .builds
end

echo "Building $PRODUCT_NAME.pdx..."
$PLAYDATE_SDK_PATH/bin/pdc source .builds/$PRODUCT_NAME.pdx

if test $status -ne 0
    echo "Build failed!"
    exit 1
end

echo "Build successful!"

if test -L $PLAYDATE_SDK_PATH/Disk/Games/$PRODUCT_NAME.pdx
    rm -rf $PLAYDATE_SDK_PATH/Disk/Games/$PRODUCT_NAME.pdx
end
ln -s (pwd)/.builds/$PRODUCT_NAME.pdx $PLAYDATE_SDK_PATH/Disk/Games/$PRODUCT_NAME.pdx

$PLAYDATE_SDK_PATH/bin/Playdate\ Simulator.app/Contents/MacOS/Playdate\ Simulator .builds/$PRODUCT_NAME.pdx
