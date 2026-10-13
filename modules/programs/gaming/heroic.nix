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
      # Games/ is Heroic's default install location (13G live).
      users.${myconfig.constants.username}.directories = [
        # Live perms are 0700 (account tokens).
        {
          directory = ".config/heroic";
          mode = "0700";
        }
        ".local/share/heroic"
        ".local/state/Heroic"
      ];
    };
}
