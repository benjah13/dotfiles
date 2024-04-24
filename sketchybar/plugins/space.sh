#!/bin/sh

source "$HOME/.config/sketchybar/colors.sh"

 if [ "$SELECTED" = "true" ]; then
    COLOR=$WHITE
  else
    COLOR=$COLOR_WHITE
  fi


sketchybar --set "$NAME" background.drawing="on" \
                         icon.color=$COLOR   \
                         label.color=$COLOR \
                         background.border_color=$COLOR \

