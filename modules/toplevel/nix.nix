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
    };
  };
in
delib.module {
  name = "nix";

  # nixos.always = shared;
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
