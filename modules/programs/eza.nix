{
  delib,
  ...
}:
delib.module {
  name = "programs.eza";

  options =
    { myconfig, ... }:
    {
      programs.eza = with delib; {
        enable = boolOption true;
        icons = boolOption myconfig.fonts.enable;
      };
    };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.eza = {
        enable = true;

        git = true;
        icons = if cfg.icons then "auto" else "never";

        extraOptions = [
          "--hyperlink"
          "--long"
        ];
      };
    };

  myconfig.programs.zsh.aliases = {
    ls = "eza";
  };
}
