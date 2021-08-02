#!/usr/bin/env bash

# Xonotic dlcache location
DLCACHE=~/.xonotic/data/dlcache/

# Getting destination folder from arguments (If not set, a default value is used instead)
[ ! -z "$1" ] && DESTINATION=$1 || DESTINATION=/tmp/xonotic-music/

# Getting pattern from arguments (If pattern is not set, a default pattern is used instead)
[ ! -z "$2" ] && PATTERN=$2 || PATTERN=radio-*

# Checking if there is a dlcache
if [ -e "$DLCACHE" ]
then
    cd "$DLCACHE"
    shopt -s nullglob # Empty directory returns an empty array
    FILES=($PATTERN)
    echo "Xonotic dlcache found at \"$DLCACHE\"."
    echo "Directory contains `ls | wc -l` files (${#FILES[@]} of them match pattern \"$PATTERN\")."
    echo "Music files will be copied into \"$DESTINATION\"."
else
    echo "Xonotic dlcache was not found: \"$DLCACHE\" (doesn't exist or isn't a directory)"
fi