#!/bin/sh

# Post hooks to be called after a
# configuration rebuild

# Mainly just to reload stylix

# hyprland
pgrep Hyprland &> /dev/null && echo "Reloading hyprland" && hyprctl reload &> /dev/null;
# pgrep .waybar-wrapped &> /dev/null && echo "Restarting waybar" && killall .waybar-wrapped && echo "Running waybar" && waybar &> /dev/null & disown;
# pgrep fnott &> /dev/null && echo "Restarting fnott" && killall fnott && echo "Running fnott" && fnott &> /dev/null & disown;
# pgrep hyprpaper &> /dev/null && echo "Reapplying background via hyprpaper" && killall hyprpaper && echo "Running hyprpaper" && hyprpaper &> /dev/null & disown;
# pgrep nwggrid-server &> /dev/null && echo "Restarting nwggrid-server" && killall nwggrid-server && echo "Running nwggrid-wrapper" && nwggrid-wrapper &> /dev/null & disown;

