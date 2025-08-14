{
  delib,
  pkgs,
  host,
  lib,
  ...
}:
delib.module {
  name = "programs.waypaper";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled =
    { myconfig, ... }:
    {
      home.packages = [
        pkgs.waypaper
        (lib.mkIf myconfig.programs.hyprland.enable pkgs.hyprpaper)
        (lib.mkIf (!myconfig.programs.hyprland.enable) pkgs.swww)
      ];
    };
}
