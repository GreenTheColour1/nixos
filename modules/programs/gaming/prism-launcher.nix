{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.prism-launcher";

  options = delib.singleEnableOption host.gamingFeatured;

  home.ifEnabled.home.packages = with pkgs; [ prismlauncher ];

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        ".local/share/PrismLauncher"
        ".minecraft"
      ];
    };
}
