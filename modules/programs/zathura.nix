{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.zathura";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.programs.zathura = {
    enable = true;
  };
}
