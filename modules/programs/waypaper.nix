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
        pkgs.swww
      ];
    };
}
