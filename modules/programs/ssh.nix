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
    moduleOptions {
      enable = boolOption true;
      enableOpenssh = boolOption false;
    };

  nixos.ifEnabled =
    { myconfig, ... }:
    {
      services.openssh = {
        enable = myconfig.programs.ssh.enableOpenssh;

        # hostKeys = [
        #   {
        #     path = config.sops.secrets.ssh_host_ed25519_key.path;
        #     type = "ed25519";
        #   }
        #   {
        #     path = config.sops.secrets.ssh_host_rsa_key.path;
        #     type = "rsa";
        #   }
        # ];

      };
    };

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        # mode 0700 is mandatory: ssh ignores keys under looser dirs.
        {
          directory = ".ssh";
          mode = "0700";
        }
        {
          directory = ".gnupg";
          mode = "0700";
        }
      ];
    }
    // (
      # sshd auto-generates these into /etc/ssh (tmpfs) — without this,
      # host identity rotates every boot. Symlink form follows the
      # upstream preservation example (never bindmount all of /etc/ssh:
      # it would shadow nix-generated ssh_config).
      if myconfig.programs.ssh.enableOpenssh then
        {
          files = [
            {
              file = "/etc/ssh/ssh_host_ed25519_key";
              how = "symlink";
              configureParent = true;
            }
            {
              file = "/etc/ssh/ssh_host_rsa_key";
              how = "symlink";
              configureParent = true;
            }
          ];
        }
      else
        { }
    );

  home.ifEnabled = {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;

      settings."*" = { };

      settings."git" = {
        Host = "github.com";
        User = "git";
        Hostname = "github.com";
        IdentitiesOnly = true;
        IdentityFile = [
          "~/.ssh/id_git"
        ];
        AddKeysToAgent = "yes";
      };
    };
  };
}
