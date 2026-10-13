{
  delib,
  pkgs,
  host,
  osConfig,
  ...
}:
delib.module {
  name = "programs.lutris";

  options = delib.singleEnableOption host.gamingFeatured;

  myconfig.ifEnabled.services.flatpak.packages = [
    { appId = "net.lutris.Lutris"; }
  ];

  # Flatpak state lives in ~/.var/app (see services.flatpak), but 2.8G of
  # native data was also found live — keep both.
  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [ ".local/share/lutris" ];
    };
}
