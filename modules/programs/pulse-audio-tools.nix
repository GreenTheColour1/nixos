{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.pulese-audio-tools";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = [
    pkgs.pavucontrol
    pkgs.pamixer
  ];
}
