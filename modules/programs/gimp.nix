{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.gimp";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    gimp3-with-plugins
  ];
}
