{ inputs, ... }:
{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;

    # server should be in /var/lib/minecraft
    servers = {
      test-server = {
        enable = true;
        autoStart = false;
      };
    };
  };
}
