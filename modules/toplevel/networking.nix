{ delib, host, ... }:
delib.module {
  name = "networking";

  options.networking = with delib; {
    nameservers = listOfOption str [ ];
    hosts = attrsOfOption (listOf str) { };
  };

  # No `enable` option on this module, so `always` (not `ifEnabled`).
  # WiFi secrets live here; directory bindmount keeps the per-file
  # 0600 modes intact.
  preservation.always =
    { myconfig, ... }:
    {
      # Live perms are 0700; keyfiles inside must stay 0600.
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
