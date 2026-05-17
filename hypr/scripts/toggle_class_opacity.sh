#!/usr/bin/env bash


ACTIVE_WINDOW_JSON=$(hyprctl activewindow -j)
ACTIVE_CLASS=$(echo "$ACTIVE_WINDOW_JSON" | grep -oP '"class": "\K[^"]*')

if [ -z "$ACTIVE_CLASS" ] || [ "$ACTIVE_CLASS" = "null" ]; then exit 0; fi

if echo "$ACTIVE_WINDOW_JSON" | grep -A 10 '"tags":' | grep -q '"alpha_1"'; then
    HAS_TAG="true"
else
    HAS_TAG="false"
fi

ADDRESSES=$(hyprctl clients -j | grep -B 15 "\"class\": \"$ACTIVE_CLASS\"" | grep -oP '"address": "\K[^"]*')

for addr in $ADDRESSES; do
    if [ "$HAS_TAG" = "true" ]; then
        hyprctl dispatch tagwindow -- "-alpha_1" "address:$addr"
    else
        hyprctl dispatch tagwindow "+alpha_1" "address:$addr"
    fi
done
