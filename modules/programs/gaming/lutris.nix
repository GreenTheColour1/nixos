{
  delib,
  pkgs,
  host,
  osConfig,
  ...
}:
delib.module {
  name = "programs.lutris";

  options = delib.singleEnableOption host.gamingFeatured;

  myconfig.ifEnabled.services.flatpak.packages = [
    { appId = "net.lutris.Lutris"; }
  ];
}
