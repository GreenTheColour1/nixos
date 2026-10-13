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

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      directories = [
        {
          directory = "/var/lib/bluetooth";
          mode = "0700";
        }
      ];
      users.${myconfig.constants.username}.directories = [ ".config/bluetuith" ];
    };

  home.ifEnabled =
    { cfg, ... }:
    {
      services.mpris-proxy.enable = cfg.enableMprisProxy;

      home.packages = with pkgs; [ bluetuith ];
    };
}
