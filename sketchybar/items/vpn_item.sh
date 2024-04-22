#!/bin/bash

PLUGIN_DIR="~/.config/sketchybar/plugins"

sketchybar --add item vpn right \
           --set vpn update_freq=10 script="$PLUGIN_DIR/vpn.sh" \
