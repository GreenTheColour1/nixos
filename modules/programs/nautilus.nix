{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.nautilus";

  options = delib.singleEnableOption false;

  home.ifEnabled.home.packages = [ pkgs.nautilus ];
}
