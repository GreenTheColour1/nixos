{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.opencode";

  options = delib.singleEnableOption host.aiFeatured;

  home.ifEnabled.home.packages = [ pkgs.opencode ];
}
