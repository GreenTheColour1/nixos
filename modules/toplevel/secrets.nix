{
  delib,
  homeconfig,
  inputs,
  ...
}:
delib.module {
  name = "secrets";

  options.sops = with delib; {
    secrets = attrsOption { };
  };

  # No `enable` option on this module, so `always` (not `ifEnabled`).
  # Without this, the age key lives on tmpfs on an impermanent system
  # and sops breaks permanently after the first reboot (nothing left
  # to decrypt the password / host keys with).
  preservation.always =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.files = [
        {
          file = ".config/sops/age/keys.txt";
          mode = "0600";
          # Immediate parents (.config/sops/age) would otherwise be
          # created root-owned; with this they belong to the user.
          configureParent = true;
        }
      ];
    };

  nixos.always =
    { myconfig, ... }:
    {
      imports = [ inputs.sops-nix.nixosModules.sops ];

      sops.defaultSopsFile = ../../secrets.yaml;
      sops.defaultSopsFormat = "yaml";

      sops.age.keyFile = "/persist//${homeconfig.home.homeDirectory}/.config/sops/age/keys.txt";

      sops.secrets = {
        "gh_private_key" = {
          path = "/${homeconfig.home.homeDirectory}/.ssh/id_git";
          owner = myconfig.constants.username;
        };
        "wg_laptop" = { };
      }
      // myconfig.sops.secrets;
    };
}
