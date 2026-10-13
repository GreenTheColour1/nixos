{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "itch";

  options = delib.singleEnableOption host.gamingFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    itch
  ];

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [ ".config/itch" ];
    };
}
