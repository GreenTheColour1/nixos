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
}
