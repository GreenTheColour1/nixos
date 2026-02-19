{
  delib,
  inputs,
  host,
  lib,
  pkgs,
  ...
}:
delib.module {
  name = "programs.apt";

  options = delib.singleEnableOption host.gamingFeatured;

  home.ifEnabled =
    { myconfig, ... }:
    {
      home.packages = [ inputs.greenpkgs.packages.x86_64-linux.awakened-poe-trade ];

      # wayland.windowManager.hyprland.settings.binds = lib.mkIf myconfig.programs.hyprland.enable [
      #   "CTRL, D, pass, ^(awakened-poe-trade)$"
      #   ", F5, pass, ^(awakened-poe-trade)$"
      # ];
    };
}
