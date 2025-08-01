{
  delib,
  host,
  pkgs,
  lib,
  ...
}:
delib.module {
  name = "programs.zsh";

  options = {
    programs.zsh = {
      enable = delib.boolOption host.cliFeatured;
      aliases = lib.mkOption {
        type = lib.types.listOf (lib.types.attrsOf lib.types.str);
        default = [ ];
      };
    };
  };

  nixos.ifEnabled = {
    programs.zsh.enable = true;

    environment.shells = with pkgs; [ zsh ];
    users.defaultUserShell = pkgs.zsh;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        enableCompletion = true;
        shellAliases = lib.mkMerge cfg.aliases;
        initContent = "microfetch";
      };
    };
}
