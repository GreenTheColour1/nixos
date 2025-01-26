{
  delib,
  pkgs,
  lib,
  ...
}: let
  shared.nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "@wheel"];
    };
  };
in
  delib.module {
    name = "nix";

    nixos.always = shared;
    home.always = shared;
  }
