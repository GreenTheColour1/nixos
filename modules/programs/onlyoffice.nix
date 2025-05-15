{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.onlyoffice";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = [ pkgs.onlyoffice-bin ];
}
