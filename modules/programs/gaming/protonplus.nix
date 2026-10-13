{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.protonplus";

  options = delib.singleEnableOption host.gamingFeatured;

  home.ifEnabled = {
    home.packages = with pkgs; [
      protonplus
    ];
  };

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        ".config/protonplus"
        ".local/state/ProtonPlus"
      ];
    };
}
