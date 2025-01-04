{ inputs, ... }:
{
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  services.flatpak.enable = true;

  services.flatpak.packages = [
    "org.DolphinEmu.dolphin-emu"
    "com.github.tchx84.Flatseal"
    "com.usebottles.bottles"
  ];
}
