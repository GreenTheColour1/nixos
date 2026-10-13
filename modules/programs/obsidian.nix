{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.obsidian";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled = {
    programs.obsidian = {
      enable = true;

      defaultSettings = {
        app = {
          vimMode = true;
        };
      };

      vaults = {
        "School" = {
          enable = true;
          target = "Documents/Obsidian/";
        };
      };
    };
  };

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      # Bulk Documents/ lives in xdg.nix; this is the app-side remainder.
      users.${myconfig.constants.username}.directories = [
        "Obsidian"
        # Live perms are 0700 (vault registry + sync credentials).
        {
          directory = ".config/obsidian";
          mode = "0700";
        }
      ];
    };
}
