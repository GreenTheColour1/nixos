{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.nautilus";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = [ pkgs.nautilus ];
}
