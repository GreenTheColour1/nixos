{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.anki";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.home.packages = with pkgs; [ anki ];
}
