{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.hyprshot";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = [ pkgs.hyprshot ];
}
