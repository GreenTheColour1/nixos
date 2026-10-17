{ delib, host, ... }:
delib.module {
  name = "amethyst-modmanager";

  options = delib.singleEnableOption host.gamingFeatured;

  myconfig.ifEnabled.services.flatpak.packages = [
    {
      appId = "io.github.Amethyst.ModManager";
      origin = "modmanager-origin";
    }
  ];
}
