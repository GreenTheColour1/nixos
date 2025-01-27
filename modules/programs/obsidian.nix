{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.obsidian";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = [ pkgs.obsidian ];
}
