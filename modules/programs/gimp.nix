{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.gimp";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.packages = with pkgs; [
    gimp-with-plugins
  ];
}
