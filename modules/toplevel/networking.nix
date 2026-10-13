{ delib, host, ... }:
delib.module {
  name = "networking";

  options.networking = with delib; {
    nameservers = listOfOption str [ ];
    hosts = attrsOfOption (listOf str) { };
  };

  preservation.always =
    { myconfig, ... }:
    {
      directories = [
        {
          directory = "/etc/NetworkManager/system-connections";
          mode = "0700";
        }
      ];
      users.${myconfig.constants.username}.directories = [ ".config/networkmanager-dmenu" ];
    };

  nixos.always =
    { cfg, myconfig, ... }:
    {
      networking = {
        hostName = host.name;

        firewall.enable = false;
        networkmanager.enable = true;

        inherit (cfg) hosts nameservers;
      };

      users.users.${myconfig.constants.username}.extraGroups = [ "networkmanager" ];
    };
}
