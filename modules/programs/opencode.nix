{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.opencode";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled.home.packages = [ pkgs.opencode ];

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        ".config/opencode"
        ".local/share/opencode"
        ".local/state/opencode"
        ".firefox-devtools-mcp"
      ];
    };
}
