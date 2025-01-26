{ delib, host, pkgs, ... }:
delib.module {
  name = "programs.steam";

  options = delib.singleEnableOption host.isDesktop;

  nixos.ifEnabled.environment.systemPackages = [pkgs.steam];

  nixos.ifEnabled.programs.steam = {
    enable = true;
    protontricks.enable = true;
  };
}
