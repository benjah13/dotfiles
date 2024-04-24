#!/bin/sh

source "$HOME/.config/sketchybar/colors.sh"

VPN_ON="$(ifconfig -v | grep utun4)"

if [ "$VPN_ON" = "" ]; then
  ICON="" COLOR="$COLOR_BLACK_BRIGHT"
else
  ICON="" COLOR="$COLOR_GREEN"
fi


sketchybar --set "$NAME" \
                 icon="$ICON" \
                 icon.color="$COLOR" \
                 label="VPN" \
                 background.drawing="on" \
                 background.border_color="$COLOR_WHITE" \
                 background.border_width=1 \
                 background.corner_radius=5 \
                 background.height=25 \
                 icon.padding_left=12 \
                 icon.padding_right=6 \
                 label.padding_right=12
