{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.waypaper";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.home.packages = [
    pkgs.waypaper
    pkgs.hyprpaper
  ];
}
