{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.chatterino";

  # options = delib.singleEnableOption host.isDesktop;
  options = delib.singleEnableOption false;

  home.ifEnabled.home.packages = with pkgs; [ chatterino7 ];

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [ ".local/share/chatterino" ];
    };
}
