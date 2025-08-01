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

  home.ifEnabled = {
    programs.lutris = {
      enable = true;
      steamPackage = pkgs.steam;
    };
  };
}
