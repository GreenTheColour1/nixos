{
  delib,
  host,
  pkgs,
  inputs,
  ...
}:
delib.module {
  name = "programs.discord";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled = {
    home.packages = with pkgs; [ vesktop ];
  };
}
