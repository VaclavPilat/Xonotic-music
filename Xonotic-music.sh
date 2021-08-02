#!/usr/bin/env bash

DLCACHE=~/.xonotic/data/dlcache

# Checking if there is a dlcache
if [ -e "$DLCACHE" ]
then
    echo "Xonotic dlcache found at \"$DLCACHE\", contains X files"
    cd "$DLCACHE"
else
    echo "Xonotic dlcache was not found: \"$DLCACHE\""
fi