{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.hyprshot";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.home.packages = [ pkgs.hyprshot ];
}
