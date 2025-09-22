{ delib, ... }:
delib.host {
  name = "nixos-fishy";

  rice = "gruvbox-dark-medium";
  type = "desktop";

  features = [
    "wireless"
    "gaming"
  ];

  displays = [
    {
      name = "DP-1";
      primary = true;
      refreshRate = 144;
      width = 1920;
      height = 1080;
      x = 0;
      y = 0;
    }
    {
      name = "HDMI-A-1";
      refreshRate = 60;
      width = 1920;
      height = 1080;
      x = 1920;
      y = 0;
    }
    {
      name = "DP-3";
      refreshRate = 75;
      width = 1920;
      height = 1080;
      x = -1920;
      y = 0;
    }
  ];

  myconfig.programs.hardware.logitech.enable = true;
  myconfig.boot.enableSecureBoot = true;

  myconfig.sops.secrets = {
    "ssh_host_ed25519_key" = {
      owner = "root";
      group = "root";
      mode = "0400";
      sopsFile = ./secrets.yaml;
    };
    "ssh_host_rsa_key" = {
      owner = "root";
      group = "root";
      mode = "0400";
      sopsFile = ./secrets.yaml;
    };
  };
}
