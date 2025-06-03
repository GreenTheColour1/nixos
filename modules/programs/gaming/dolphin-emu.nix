{ delib, host, ... }:
delib.module {
  name = "programs.dolphin-emu";

  options = delib.singleEnableOption host.isDesktop;

  myconfig.ifEnabled.services.flatpak.packages = [
    {
      appId = "org.DolphinEmu.dolphin-emu";
      origin = "dolphin-emu";
    }
  ];
}
