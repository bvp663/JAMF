#!/bin/bash
#Determine if the custom desktop wallpaper is currently being applied.

wallpaper=$(osascript -e 'tell app "finder" to get posix path of (get desktop picture as alias)')
path=$(dirname "$wallpaper")

if [[ $path == "/Library/Desktop Pictures/Custom" ]]; then
  echo "<result>SET</result>"
else
  echo "<result>NOT SET</result>"
fi
