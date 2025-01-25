{ delib, ... }:
delib.host {
  name = "nixos-fishy";

  homeManagerSystem = "x86_64-linux";
  home.home.stateVersion = "24.05";

  nixos = {
    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = "24.05";
  };
}
