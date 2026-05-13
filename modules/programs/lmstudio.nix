{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.lmstudio";

  options = delib.singleEnableOption host.aiFeatured;

  home.ifEnabled.home.packages = with pkgs; [ lmstudio ];
}
