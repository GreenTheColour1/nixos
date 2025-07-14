{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.thunderbird";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.programs.thunderbird = {
    enable = true;
  };
}
