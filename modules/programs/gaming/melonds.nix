{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.melonds";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = with pkgs; [
    melonDS
  ];
}
