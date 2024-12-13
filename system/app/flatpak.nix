{ inputs, ... }:
{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

  services.flatpak.enable = true;

  services.flatpak.packages = [
    # "com.adamcake.Bolt"
    "org.DolphinEmu.dolphin-emu"
    "com.github.tchx84.Flatseal"
  ];
}
