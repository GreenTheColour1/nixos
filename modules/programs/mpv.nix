{
  delib,
  host,
  ...
}:
delib.module {
  name = "programs.mpv";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.programs.mpv = {
    enable = true;
  };

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [ ".local/state/mpv" ];
    };
}
