{ delib, host, ... }:
delib.module {
  name = "services.podman";

  options.services.docker = {
    enable = host.isServer false;
  };

  nixos.ifEnabled = {
    virtualisation = {
      containers.enable = true;
      podman = {
        enable = true;
        dockerCompat = true;
        autoPrune.enable = true;
        defaultNetwork.settings.dns_enabled = true;
      };
    };
    users.users.fishy = {
      extraGroups = [
        "podman"
      ];
    };
  };
}
