{ delib, host, ... }: 
delib.module {
  name = "networking";

  options.networking = with delib; {
    nameservers = listOfOption str [];
    hosts = attrsOfOption (listOf str) {};
  };

  nixos.always = { cfg, ... }: {
    networking = {
      hostName = host.username;

      firewall.enable = true;
      networkmanager.enable = true;

      inherit (cfg) hosts nameservers;
    };

    user.extraGroups = [ "networkmanager" ];
  };
}
