{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.path-of-building";

  options = delib.singleEnableOption host.gamingFeatured;

  myconfig.ifEnabled.services.flatpak.packages = [
    {
      appId = "community.pathofbuilding.PathOfBuilding";
      origin = "flathub";
    }
  ];

  # Flatpak install: all state lives in ~/.var/app (see services.flatpak).

  # home.ifEnabled.home.packages = with pkgs; [
  #   rusty-path-of-building
  # ];
}
