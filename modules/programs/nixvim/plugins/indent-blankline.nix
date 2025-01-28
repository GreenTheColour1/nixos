{ delib, ... }:
delib.module {
  name = "programs.nixvim.plugins.indent-blankline";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim.plugins.indent-blankline = {
    enable = true;
  };
}
