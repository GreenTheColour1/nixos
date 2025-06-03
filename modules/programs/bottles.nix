{ delib, host, ... }:
delib.module {
  name = "programs.bottles";

  options = delib.singleEnableOption host.isDesktop;

  myconfig.ifEnabled.services.flatpak.packages = [
    { appId = "com.usebottles.bottles"; }
  ];
}
