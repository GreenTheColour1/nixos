{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.opencode";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled.home.packages = [ pkgs.opencode ];
}
