{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.chatterino";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = with pkgs; [ chatterino7 ];
}
