#!/bin/bash

PLUGIN_DIR="~/.config/sketchybar/plugins"

sketchybar --add item chevron left \
           --set chevron icon= label.drawing=off \
           --add item front_app left \
           --set front_app icon.drawing=off script="$PLUGIN_DIR/front_app.sh" \
           --subscribe front_app front_app_switched


           sketchybar --add item media left \
           --set media label.color=$COLOR_BLUE_BRIGHT \
                       label.max_chars=40 \
                       icon.padding_left=0 \
                       scroll_texts=on \
                       icon=             \
                       icon.color=$COLOR_BLUE_BRIGHT   \
                       background.drawing=on \
                       script="$PLUGIN_DIR/media.sh" \
           --subscribe media media_change
