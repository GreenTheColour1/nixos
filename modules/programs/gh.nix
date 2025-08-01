{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.gh";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled = {
    home.packages = [ pkgs.gh ];

    programs.gh.enable = true;
  };
}
