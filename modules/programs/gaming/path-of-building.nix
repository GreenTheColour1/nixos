{ delib, host, ... }:
delib.module {
  name = "programs.path-of-building";

  options = delib.singleEnableOption host.isDesktop;

  myconfig.ifEnabled.services.flatpak.packages = [
    "community.pathofbuilding.PathOfBuilding"
  ];
}
