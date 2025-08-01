{
  delib,
  inputs,
  host,
  lib,
  ...
}:
delib.module {
  name = "programs.apt";

  options = delib.singleEnableOption host.gamingFeatured;

  home.ifEnabled =
    { myconfig, ... }:
    {
      home.packages = [ inputs.greenpkgs.packages.x86_64-linux.awakened-poe-trade ];

      wayland.windowManager.hyprland.settings.binds = lib.mkIf myconfig.programs.hyprland.enable [
        "CTRL, D, pass, pid:14260"
        ", F5, pass, pid:14260"
      ];
    };
}
