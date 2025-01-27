{
  delib,
  homeconfig,
  pkgs,
  inputs,
  ...
}:
delib.module {
  name = "secrets";

  nixos.always = {
    imports = [ inputs.sops-nix.nixosModules.sops ];

    sops.defaultSopsFile = ../../secrets.yaml;
    sops.defaultSopsFormat = "yaml";

    sops.age.keyFile = "/${homeconfig.home.homeDirectory}/.config/sops/age/keys.txt";

    secrets = {
      "gh_private_key" = {
        path = "/${homeconfig.home.homeDirectory}/.ssh/id_ed25519";
      };
    };
  };
}
