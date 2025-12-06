{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "itch";

  options = delib.singleEnableOption host.gamingFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    itch
  ];
}
