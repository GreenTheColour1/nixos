{ delib, host, pkgs, ...}:
delib.module {
  name = "programs.bolt-launcher";

  options = delib.singleEnableOption host.isDesktop;

  home.isEnabled.home.packages = [ pkgs.bolt-launcher ];
}
