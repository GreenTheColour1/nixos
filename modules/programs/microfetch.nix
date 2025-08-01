{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.microfetch";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled.home.packages = [ pkgs.microfetch ];
}
