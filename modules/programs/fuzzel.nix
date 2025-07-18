{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.fuzzel";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled = {
    programs.fuzzel = {
      enable = true;
    };
  };
}
