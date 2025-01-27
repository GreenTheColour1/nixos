{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.clipese";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = [
    pkgs.clipse
    pkgs.wl-clipboard
  ];
}
