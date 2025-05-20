{ delib, ... }:
delib.module {
  name = "programs.nixvim.plugins.floaterm";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim.plugins.floaterm = {
    enable = true;
    settings = {
      # shell = "zsh";
      keymap_toggle = "<C-t>";
    };
  };
}
