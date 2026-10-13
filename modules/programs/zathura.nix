{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.zathura";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.programs.zathura = {
    enable = true;
  };

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        # Live perms are 0700.
        {
          directory = ".local/share/zathura";
          mode = "0700";
        }
      ];
    };
}
