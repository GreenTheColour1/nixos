{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.chatterino";

  # options = delib.singleEnableOption host.isDesktop;
  options = delib.singleEnableOption false;

  home.ifEnabled.home.packages = with pkgs; [ chatterino7 ];
}
