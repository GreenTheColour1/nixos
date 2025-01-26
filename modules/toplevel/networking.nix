{ delib, host, ... }: 
delib.module {
  name = "networking";

  options.networking = with delib; {
    nameservers = listOfOption str [];
    hosts = attrsOfOption (listOf str) {};
  };

  nixos.always = { cfg, myconfig, ... }: {
    networking = {
      hostName = host.name;

      firewall.enable = true;
      networkmanager.enable = true;

      inherit (cfg) hosts nameservers;
    };

    users.users.${myconfig.constants.username}.extraGroups = [ "networkmanager" ];
  };
}
