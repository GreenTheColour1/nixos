{ inputs, ... }:
{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft = {
    enable = true;
    eula = true;
    dataDir = "~/Documents/minecraft-server";

    server = {
      test-server = {
        enable = true;
      };
    };
  };
}
