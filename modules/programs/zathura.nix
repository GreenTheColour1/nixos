{
  delib,
  host,
  pkgs,
  ...
}:
delib.modules {
  name = "programs.zathura";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.programs.zathura = {
    enable = true;
  };
}
