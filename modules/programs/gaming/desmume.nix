{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.desmume";

  options = delib.singleEnableOption host.gamingFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    desmume
  ];

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [ ".config/desmume" ];
    };
}
