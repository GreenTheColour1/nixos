{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.qbittorrent";

  options = delib.singleEnableOption host.guiFeatured;

  nixos.ifEnabled.environment.systemPackages = with pkgs; [ qbittorrent ];

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [ ".config/qBittorrent" ];
    };
}
