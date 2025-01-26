{ delib, pkgs, host, config, ... }:
delib.module {
  name = "nvidia";

  options = delib.singleEnableOption host.isDesktop;

  nixos.ifEnabled = {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    hardware.nvidia = {
      modesetting.enable = true;
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
