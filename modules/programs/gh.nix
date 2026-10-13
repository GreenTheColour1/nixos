{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.gh";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled = {
    programs.gh.enable = true;
  };

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        # Live perms are the odd-looking 0751 (gh's own doing); keep them
        # so a "cleanup" to 0755 can't widen access later.
        {
          directory = ".config/gh";
          mode = "0751";
        }
      ];
    };
}
