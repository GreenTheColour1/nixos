{ delib, host, ... }:
delib.module {
  name = "programs.bottles";

  options = delib.singleEnableOption host.isDesktop;

  myconfig.ifEnabled.programs.flatpak.packages = [
    "com.usebottles.bottles"
  ];
}
