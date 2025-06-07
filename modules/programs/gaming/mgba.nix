{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.mgba";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = with pkgs; [
    mgba
  ];
}
