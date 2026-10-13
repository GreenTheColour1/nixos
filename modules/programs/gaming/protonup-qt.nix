{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.protonup-qt";

  options = delib.singleEnableOption host.gamingFeatured;

  home.ifEnabled.home.packages = with pkgs; [ protonup-qt ];

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        ".config/protonup-qt"
        ".config/pupgui"
      ];
    };
}
