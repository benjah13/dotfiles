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
                 background.drawing="on" \
                 label="VPN" \
