#!/bin/sh

for item in $(dconf dump / |grep '^\[.*keybindings.*\]$'); do
  item=$(echo $item|sed 's/\[//g' |sed 's/\]//g')
  schema="/${item}/"
  file_path="$(echo $item|sed 's#/#_#g').txt"
  echo $schema '>>' $file_path
  dconf dump $schema > $file_path
done
