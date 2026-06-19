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
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };

    services.blueman.enable = true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      services.mpris-proxy.enable = cfg.enableMprisProxy;

      home.packages = with pkgs; [ bluetuith ];
    };
}
