#!/bin/bash

PLUGIN_DIR="~/.config/sketchybar/plugins"

sketchybar --add item volume right \
           --set volume script="$PLUGIN_DIR/volume.sh" \
           --subscribe volume volume_change \ 
