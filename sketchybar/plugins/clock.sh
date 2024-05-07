#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

source "$HOME/.config/sketchybar/colors.sh"

sketchybar --set "$NAME" label="$(date '+%d/%m %H:%M')" \
                 background.drawing="on" \
                 background.border_color="$COLOR_WHITE" \
                 background.border_width=1 \
                 background.corner_radius=5 \
                 background.height=25 \
                 label.padding_right=12 \
                 label.font="Hack Nerd Font:Bold:12.0"
