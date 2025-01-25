{ delib, host, pkgs, ... }:
delib.module {
  name = "programs.mangohud";

  options = delib.singleEnableOption host.isDesktop;

  nixos.ifEnabled.environment.systemPackages = [ pkgs.mangohud ];
}
