{ delib, host, pkgs, ... }:
delib.module {
  name = "programs.microfetch";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = [ pkgs.microfetch ];
}
