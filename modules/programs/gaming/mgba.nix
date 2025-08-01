{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.mgba";

  options = delib.singleEnableOption host.gamingFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    mgba
  ];
}
