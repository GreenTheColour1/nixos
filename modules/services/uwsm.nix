{
  delib,
  host,
  pkgs,
  lib,
  ...
}:
delib.module {
  name = "services.uwsm";

  options = delib.simpleEnableOption host.isDesktop;

  nixos.ifEnabled =
    { myconfig, ... }:
    {
      programs.uwsm = {
        enable = true;
        waylandCompositors = lib.mkIf myconfig.programs.hyprland.enable {
          hyprland = {
            prettyName = "Hyprland";
            comment = "Hyprland compositor managed by UWSM";
            binPath = "/run/current-system/sw/bin/Hyprland";
          };
        };
      };
    };
}
