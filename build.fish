#!/usr/bin/env fish

set PLAYDATE_SDK_PATH "/root/PlaydateSDK/PlaydateSDK-3.0.2/"
# Set product name
set PRODUCT_NAME Gutwound

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

# Build the package using pdc (Playdate Compiler)
echo "Building $PRODUCT_NAME.pdx..."
$PLAYDATE_SDK_PATH/bin/pdc source .builds/$PRODUCT_NAME.pdx

if test $status -ne 0
    echo "Build failed!"
    exit 1
end

echo "Build successful!"

# Create a symbolic link to the compiled pdx in the Playdate Simulator Games dir
# This allows browsing the pdx as a sideloaded game, helpful for checking icons
if test -L $PLAYDATE_SDK_PATH/Disk/Games/$PRODUCT_NAME.pdx
    rm -rf $PLAYDATE_SDK_PATH/Disk/Games/$PRODUCT_NAME.pdx
end
ln -s (pwd)/.builds/$PRODUCT_NAME.pdx $PLAYDATE_SDK_PATH/Disk/Games/$PRODUCT_NAME.pdx

# Launch the simulator (note: may need webkit2gtk-4.1 library installed on Linux)
echo "Launching Playdate Simulator..."
$PLAYDATE_SDK_PATH/bin/PlaydateSimulator .builds/$PRODUCT_NAME.pdx
