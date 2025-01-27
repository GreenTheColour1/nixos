{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.waypaper";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = [ pkgs.waypaper ];
}
