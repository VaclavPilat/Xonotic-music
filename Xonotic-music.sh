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
    mkdir -p $DESTINATION # Recursively creating destination folder
    BEFORE=`ls $DESTINATION | wc -l` # Number of files before unzipping
    echo "Music files will be copied into \"$DESTINATION\". This folder already contains $BEFORE files."
    INDEX=0
    for FILE in "${FILES[@]}" # Extracting files from each archive
    do
        INDEX=$((INDEX + 1))
        NOW=`ls $DESTINATION | wc -l` # Number of files right now
        unzip -nq $FILE -d $DESTINATION -x "INFO" "LICENSE" 2>&- # Supressing errors while unzipping files
        if [ $? == 0 ] # Looking for errors
        then
            MESSAGE="OK"
        else
            MESSAGE="ERROR"
        fi
        echo "$INDEX / ${#FILES[@]} :: $FILE :: $MESSAGE ($((`ls $DESTINATION | wc -l` - $NOW)) files extracted)"
    done
    AFTER=`ls $DESTINATION | wc -l` # Number of files after unzipping
    echo "Unzipping complete. $(($AFTER - $BEFORE)) files out of ${#FILES[@]} archives were unzipped successfully. Folder now contains $AFTER files."
    cd $DESTINATION
    find . ! -name "*.ogg" ! -name "." ! -name ".." -exec rm -rf {} \; 2>&- # Supressing errors while removing unnecessary files
    NOW=`ls $DESTINATION | wc -l` # Number of files right now
    echo "Cleaning complete. Removed $(($AFTER - $NOW)) unnecessary files (out of $AFTER files). Folder now contains $NOW files."
else
    echo "Xonotic dlcache was not found: \"$DLCACHE\" (doesn't exist or isn't a directory)"
fi