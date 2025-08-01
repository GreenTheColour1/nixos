{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.nautilus";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.home.packages = [ pkgs.nautilus ];
}
