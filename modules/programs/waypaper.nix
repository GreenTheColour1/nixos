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
        pkgs.awww
      ];
    };

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        ".config/waypaper"
        ".local/state/waypaper"
        ".cache/waypaper"
        ".cache/awww"
      ];
    };
}
