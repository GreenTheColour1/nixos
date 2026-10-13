{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.heroic";

  options = delib.singleEnableOption host.gamingFeatured;

  home.ifEnabled.home.packages = with pkgs; [ heroic ];

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        {
          directory = ".config/heroic";
          mode = "0700";
        }
        ".local/share/heroic"
        ".local/state/Heroic"
      ];
    };
}
