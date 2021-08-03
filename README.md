# Xonotic music
A simple Bash script that extracts music files from Xonotic's data cache.

## How it works
Xonotic's data cache has a lot of .ZIP files. Some of them contain .OGG music files. This program finds all archives that match selected pattern and files from them into a selected destination folder (that will be created if it doesn't exist). Then it removes all files that don't have (case insensitive) .OGG extension.

## How to run
Make sure you have installed `unzip` package. 

You can run the code from a console like this (the first argument is a destination folder, where all music files will be extracted to; and the second argument will be used as a pattern):
```
./Xonotic-music.sh ~/Music/Xonotic radio-royalty-free-*
```
If you don't use the arguments, the program will use default values instead:
```
./Xonotic-music.sh
```