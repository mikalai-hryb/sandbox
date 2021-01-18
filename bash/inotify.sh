#! /bin/bash

echo "Inotify"

sudo mkdir -p /temp/newFolder
inotifywait -m /temp/newFolder