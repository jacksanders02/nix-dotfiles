#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

# Copy wallpapers
mkdir -p ~/Pictures
cp -r wallpapers ~/Pictures/wallpapers
