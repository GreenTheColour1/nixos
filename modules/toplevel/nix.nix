{
  delib,
  inputs,
  ...
}:
let
  shared.nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "@wheel"
      ];
      # substituters = [ "https://nix-community.cachix.org" ];
      # trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
    };
  };
in
delib.module {
  name = "nix";

  nixos.always = {
    nix = {
      settings = shared.nix.settings;

      nixPath = [
        "nixpkgs=${inputs.nixpkgs}"
        "nixos-config=$HOME/.dotfiles/"
      ];
    };
  };
  home.always = shared;
}
