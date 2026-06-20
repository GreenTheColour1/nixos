{ delib, ... }:
delib.host {
  name = "midori";

  rice = "gruvbox-dark-medium";
  type = "server";

  features = [
    "wireless"
  ];

  myconfig = {
    programs = {
      ssh.enableOpenssh = true;
    };
    services = {
    };
  };
}
