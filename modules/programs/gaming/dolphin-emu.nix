{ delib, host, ... }:
delib.module {
  name = "programs.dolphin-emu";

  options = delib.singleEnableOption host.gamingFeatured;

  myconfig.ifEnabled.services.flatpak.packages = [
    {
      appId = "org.DolphinEmu.dolphin-emu";
      origin = "dolphin-emu";
    }
  ];
}
