{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.gh";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled = {
    home.packages = [ pkgs.gh ];

    programs.gh.enable = true;
  };
}
