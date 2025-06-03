{ delib, host, ... }:
delib.module {
  name = "programs.flatseal";

  options = delib.singleEnableOption host.isDesktop;

  myconfig.ifEnabled.services.flatpak.packages = [
    { appId = "com.github.tchx84.Flatseal"; }
  ];
}
