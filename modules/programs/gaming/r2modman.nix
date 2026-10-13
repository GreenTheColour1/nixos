{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.r2modman";

  options = delib.singleEnableOption host.gamingFeatured;

  home.ifEnabled.home.packages = [ pkgs.r2modman ];

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        {
          directory = ".config/r2modman";
          mode = "0700";
        }
        ".config/r2modmanPlus-local"
      ];
    };
}
