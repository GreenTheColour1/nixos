{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.protonup-qt";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = with pkgs; [ protonup-qt ];
}
