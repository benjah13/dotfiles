#!/bin/sh

source "$HOME/.config/sketchybar/colors.sh"

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"

  case "$VOLUME" in
    [6-9][0-9]|100) ICON="󰕾"
    ;;
    [3-5][0-9]) ICON="󰖀"
    ;;
    [1-9]|[1-2][0-9]) ICON="󰕿"
    ;;
    *) ICON="󰖁"
  esac

  sketchybar --set "$NAME" icon="$ICON" label="$VOLUME%" \
                 background.drawing="on" \
                 background.border_color="$COLOR_WHITE" \
                 background.border_width=1 \
                 background.corner_radius=5 \
                 background.height=25 \
                 icon.padding_left=12 \
                 icon.padding_right=6 \
                 label.padding_right=12
fi
