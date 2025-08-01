{ delib, host, ... }:
delib.module {
  name = "programs.flatseal";

  options = delib.singleEnableOption host.guiFeatured;

  myconfig.ifEnabled.services.flatpak.packages = [
    { appId = "com.github.tchx84.Flatseal"; }
  ];
}
