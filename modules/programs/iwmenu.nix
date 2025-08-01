{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.iwmenu";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    iwmenu
  ];
}
