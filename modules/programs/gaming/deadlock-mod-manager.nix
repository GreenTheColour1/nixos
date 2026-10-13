{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.deadlock-mod-manager";

  options = delib.singleEnableOption host.gamingFeatured;

  home.ifEnabled.home.packages = [ pkgs.deadlock-mod-manager ];

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [ ".config/deadlock-mod-manager" ];
    };
}
