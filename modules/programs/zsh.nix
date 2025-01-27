{ delib, host, ... }:
delib.module {
  name = "programs.zsh";

  options = {
    programs.zsh = {
      enable = delib.boolOption host.isDesktop;
      aliases = delib.attrsOfOption delib.str { };
    };
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
        initExtra = "microfetch";
      };
    };
}
