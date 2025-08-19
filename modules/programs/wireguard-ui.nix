{
  delib,
  host,
  pkgs,
  myconfig,
  ...
}:
delib.module {
  name = "programs.wireguard-ui";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.home.packages = [ pkgs.wireguard-ui ];
}
