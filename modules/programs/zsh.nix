{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.zsh";

  options = {
    programs.zsh = {
      enable = delib.boolOption host.isDesktop;
      aliases = delib.attrsOfOption delib.str { };
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
        shellAliases = cfg.aliases;
        initContent = "microfetch";
      };
    };
}
