{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.obsidian";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.home.packages = [ pkgs.obsidian ];
}
