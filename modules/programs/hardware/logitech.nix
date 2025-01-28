{ delib, host, ... }:
delib.module {
  name = "programs.hardware.logitech";

  options = delib.singleEnableOption host.isDesktop;

  nixos.ifEnabled.hardware.logitech = {
    wireless = {
      enable = true;
      enableGraphical = true;
    };
  };
}
