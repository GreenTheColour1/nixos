{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.bolt-launcher";

  options = delib.singleEnableOption host.gamingFeatured;

  # home.ifEnabled.home.packages = [ pkgs.bolt-launcher ];

  myconfig.ifEnabled.services.flatpak.packages = [ { appId = "com.adamcake.Bolt"; } ];
}
