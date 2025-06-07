{
  delib,
  pkgs,
  host,
  osConfig,
  ...
}:
delib.module {
  name = "programs.lutris";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabed = {
    programs.lutris = {
      enable = true;
      steamPackage = osConfig.programs.steam.package;
    };
  };
}
