{delib, host, ...}:
delib.module {
  name = "programs.path-of-building";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.programs.flatpak.packages = [
    "community.pathofbuilding.PathOfBuilding"
  ];
}
