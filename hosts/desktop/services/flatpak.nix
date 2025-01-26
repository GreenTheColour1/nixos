{ delib, ... }:
delib.host {
  name = "nixos-fishy";

  myconfig.services.flatpak.packages = [
    "org.DolphinEmu.dolphin-emu"
    "com.github.tchx84.Flatseal"
    "com.usebottles.bottles"
  ];
}
