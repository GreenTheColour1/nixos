{ delib, host, pkgs, ...}:
delib.module {
  name = "programs.r2modman";

  options = delib.singleEnableOption host.isDesktop;

  home.isEnabled.home.packages = [ pkgs.r2modman ];
}
