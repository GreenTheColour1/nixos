{ delib, host, ... }:
delib.module {
  name = "programs.dolphin-emu";

  options = delib.singleEnableOption host.isDesktop;

  myconfig.ifEnabled.services.flatpak.packages = [
    "org.DolphinEmu.dolphin-emu"
  ];
}
