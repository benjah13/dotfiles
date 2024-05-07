#!/bin/sh

source "$HOME/.config/sketchybar/colors.sh"

function getBytes {
    netstat -w1 > ~/.config/sketchybar/plugins/network.out & sleep 1; kill $!
}

BYTES=$(getBytes > /dev/null)
BYTES=$(cat ~/.config/sketchybar/plugins/network.out | grep '[0-9].*')

DOWN=$(echo $BYTES | awk '{print $3}')
UP=$(echo $BYTES | awk '{print $6}')

function human_readable() {
    local abbrevs=(
        $((1 << 60)):ZiB
        $((1 << 50)):EiB
        $((1 << 40)):TiB
        $((1 << 30)):GiB
        $((1 << 20)):MiB
        $((1 << 10)):KiB
        $((1)):B
    )

    local bytes="${1}"
    local precision="${2}"

    for item in "${abbrevs[@]}"; do
        local factor="${item%:*}"
        local abbrev="${item#*:}"
        if [[ "${bytes}" -ge "${factor}" ]]; then
            local size="$(bc -l <<< "${bytes} / ${factor}")"
            printf "%.*f %s\n" "${precision}" "${size}" "${abbrev}"
            break
        fi
    done
}

DOWN_FORMAT=$(human_readable $DOWN 1)
UP_FORMAT=$(human_readable $UP 1)

sketchybar --set "$NAME" label="$DOWN_FORMAT/s" \
                               padding_left=2                        \
                               padding_right=2                       \
                               background.border_width=1             \
                               background.drawing = "on"             \
                               icon=⇣                                \
                               icon.color=$COLOR_GREEN               \
                               label.color=$WHITE \
                               background.border_color="$COLOR_WHITE" \
                               background.corner_radius=5 \
                               background.height=25 \
                               icon.padding_left=12 \
                               icon.padding_right=6 \
                               label.padding_right=12 \
                 label.font="Hack Nerd Font:Bold:12.0"
