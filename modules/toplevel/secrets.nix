{
  delib,
  homeconfig,
  pkgs,
  inputs,
  ...
}:
delib.module {
  name = "secrets";

  nixos.always =
    { myconfig, ... }:
    {
      imports = [ inputs.sops-nix.nixosModules.sops ];

      sops.defaultSopsFile = ../../secrets.yaml;
      sops.defaultSopsFormat = "yaml";

      sops.age.keyFile = "/${homeconfig.home.homeDirectory}/.config/sops/age/keys.txt";

      sops.secrets = {
        "gh_private_key" = {
          path = "/${homeconfig.home.homeDirectory}/.ssh/id_git";
          owner = myconfig.constants.username;
        };
      };
    };
}
