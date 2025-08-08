{ delib, host, ... }:
delib.module {
  name = "services.kde-conenct";

  options = delib.singleEnabledOption host.guiFeatured;

  home.ifEnabled = {
    services.kdeconnect = {
      enable = true;
    };

    networking.firewall = rec {
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
  };
}
