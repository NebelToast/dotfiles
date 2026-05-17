#!/usr/bin/env bash
.

# Check if ANY window has alpha_1
if hyprctl clients -j | grep -q '"alpha_1"'; then
    ANY_TAGGED="true"
else
    ANY_TAGGED="false"
fi

ADDRESSES=$(hyprctl clients -j | grep -oP '"address": "\K[^"]*')

for addr in $ADDRESSES; do
    if [ "$ANY_TAGGED" = "true" ]; then
        hyprctl dispatch tagwindow -- "-alpha_1" "address:$addr"
    else
        hyprctl dispatch tagwindow "+alpha_1" "address:$addr"
    fi
done
