{ delib, pkgs, ... }:
delib.module {
  name = "bluetooth";

  options.bluetooth = with delib; {
    enable = boolOption false;
    enableMprisProxy = boolOption true;
  };

  nixos.ifEnabled = {
    hardware.bluetooth = {
      enable = true;

      powerOnBoot = true;
    };

    services.blueman.enable = true;
  };

  home.ifEnabled = { cfg, ... }: {
    services.mpris-proxy.enable = cfg.enableMprisProxy;

    services.blueman-applet.enable = true;
  };
}
