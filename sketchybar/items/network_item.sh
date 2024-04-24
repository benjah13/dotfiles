#!/bin/bash

PLUGIN_DIR="~/.config/sketchybar/plugins"

sketchybar --add item  network right                            \
           --set       network update_freq=20 script="$PLUGIN_DIR/network.sh"  \

