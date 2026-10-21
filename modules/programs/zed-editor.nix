{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.zed-editor";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled = {
    programs.zed-editor = {
      enable = true;
      mutableUserSettings = false;

      extensions = [
        "nix"
        "codebook"
      ];

      extraPackages = with pkgs; [
        nixd
        nixfmt
      ];

      userSettings = {
        vim_mode = true;

        telemetry = {
          metrics = false;
          diagnostics = false;
        };

        languages.Nix = {
          language_servers = [
            "nixd"
            "!nil"
          ];
          formatter.external.command = "nixfmt";
        };
      };
    };
  };

  # mutableUserSettings = false, so the settings file is a store symlink.
  # Persist the db/extensions/language servers and Zed's other state.
  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        {
          directory = ".config/zed";
          mode = "0700";
        }
        {
          directory = ".local/share/zed";
          mode = "0700";
        }
      ];
    };

  myconfig.ifEnabled.programs.zsh.aliases = [
    { zed = "zeditor"; }
  ];
}
