{ delib, ... }:
delib.module {
  name = "programs.nixvim";

  home.ifEnabled.programs.nixvim = {
    colorschemes.gruvbox = {
      enable = true;
      settings = {
        terminal_colors = true;
      };
    };
  };
}
