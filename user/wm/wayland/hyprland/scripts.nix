{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "changewall" ''
      cd ~/Media/Pictures/wallpapers
      wallpaper=$(ls | sort -R | tail -1)
      hyprctl hyprpaper preload "~/Media/Pictures/wallpapers/$wallpaper"
      hyprctl hyprpaper wallpaper ",~/Media/Pictures/wallpapers/$wallpaper"
      hyprctl hyprpaper unloadunsued
    '')
  ];
}
