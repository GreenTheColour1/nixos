{ delib, ... }:
delib.module {
  name = "programs.nixvim.plugins.treesitter-textobjects";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim = {
    plugins.treesitter-textobjects = {
      enable = true;
    };
  };
}
