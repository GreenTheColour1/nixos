{
  delib,
  inputs,
  pkgs,
  lib,
  ...
}:
let
  shared.nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "@wheel"
      ];
      nix-path = [
        "nixpkgs=${inputs.nixpkgs}"
        "nixos-config=$HOME/nix-config/"
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

    };
  };
  home.always = shared;

  preservation.always =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        ".local/share/nix"
        ".local/state/nix"
      ];
    };
}
