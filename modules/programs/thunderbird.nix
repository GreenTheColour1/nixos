{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.thunderbird";

  options = delib.singleEnableOption host.guiFeatured;

  nixos.ifEnabled.programs.thunderbird = {
    enable = true;
  };

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        # Live perms are 0700 (mail + credentials).
        {
          directory = ".thunderbird";
          mode = "0700";
        }
      ];
    };
}
