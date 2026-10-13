{
  delib,
  host,
  pkgs,
  inputs,
  ...
}:
delib.module {
  name = "programs.discord";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled = {
    home.packages = with pkgs; [ vesktop ];
  };

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        # Live perms are 0700 (tokens).
        {
          directory = ".config/vesktop";
          mode = "0700";
        }
        ".config/discord"
        ".config/Vencord"
      ];
    };
}
