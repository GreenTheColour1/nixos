{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.hyprpaper";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = [ pkgs.hyprpaper ];
}
