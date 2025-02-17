{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.heroic";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = with pkgs; [ heroic ];
}
