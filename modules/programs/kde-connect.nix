{ delib, host, ... }:
delib.module {
  name = "services.kde-conenct";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled = {
    services.kdeconnect = {
      enable = true;
    };
  };

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username} = {
        directories = [ ".config/kdeconnect" ];
        files = [
          # Live perms are 0600 (pairing secrets).
          {
            file = ".local/state/kdeconnect.appstaterc";
            mode = "0600";
          }
          {
            file = ".local/state/kdeconnect.smsstaterc";
            mode = "0600";
          }
        ];
      };
    };

  # nixos.ifEnabled = {
  #   networking.firewall = rec {
  #     allowedTCPPortRanges = [
  #       {
  #         from = 1714;
  #         to = 1764;
  #       }
  #     ];
  #     allowedUDPPortRanges = allowedTCPPortRanges;
  #   };
  # };
}
