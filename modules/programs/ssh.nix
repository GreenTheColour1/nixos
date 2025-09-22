{
  delib,
  pkgs,
  config,
  ...
}:
delib.module {
  name = "programs.ssh";

  options =
    with delib;
    moduleOption {
      enable = true;
      enableOpenssh = true;
    };

  nixos.ifEnabled =
    { myconfig, ... }:
    {
      services.openssh = {
        enable = myconfig.programs.ssh.enableOpenssh;

        hostKeys = [
          {
            path = config.sops.secrets.ssh_host_ed25519_key.path;
            type = "ed25519";
          }
          {
            path = config.sops.secrets.ssh_host_rsa_key.path;
            type = "rsa";
          }
        ];

      };
    };

  home.ifEnabled = {
    programs.ssh = {
      enable = true;
      addKeysToAgent = "yes";

      matchBlocks = {
        "git" = {
          host = "github.com";
          user = "git";
          hostname = "github.com";
          identitiesOnly = true;
          identityFile = [
            "~/.ssh/id_git"
          ];
        };
      };
    };
  };
}
