#!/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl hyprpaper wallpaper eDP-1, $(find ~/Pictures/Wallpapers -type f ! -iname ".*" | shuf -n 1), cover
else
    hyprctl hyprpaper wallpaper eDP-1, $(find ~/Billup/Wallpapers -type f ! -iname ".*" | shuf -n 1), cover
fi
