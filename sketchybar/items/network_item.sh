#!/bin/bash

PLUGIN_DIR="~/.config/sketchybar/plugins"

sketchybar --add item  network.down right                            \
           --set       network.down script="$PLUGIN_DIR/network.sh"  \
                               update_freq=20                        \
                               padding_left=2                        \
                               padding_right=2                       \
                               background.border_width=1             \
                               background.drawing = "on"             \
                               background.height=24                  \
                               icon=⇣                                \
                               icon.padding_left=0                   \
                               icon.color=$COLOR_GREEN               \
                               label.color=$WHITE
