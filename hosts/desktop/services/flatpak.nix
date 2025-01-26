{ delib, ... }:
delib.host {
  name = "nixos-fishy";

  myconfig.services.flatpack.packages = [
    "org.DolphinEmu.dolphin-emu"
    "com.github.tchx84.Flatseal"
    "com.usebottles.bottles"
    "community.pathofbuilding.PathOfBuilding"
  ];
}
