{ delib, host, pkgs, ... }:
delib.module {
  name = "programs.steam";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = [pkgs.steam];

  home.ifEnabled.programs.steam = {
    enable = true;
    protontricks.enable = true;
  };
}
