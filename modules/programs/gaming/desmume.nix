{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.desmume";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = with pkgs; [
    desmume
  ];
}
