{ delib, host, ... }:
delib.module {
  name = "programs.bottles";

  options = delib.singleEnableOption host.guiFeatured;

  myconfig.ifEnabled.services.flatpak.packages = [
    { appId = "com.usebottles.bottles"; }
  ];
}
