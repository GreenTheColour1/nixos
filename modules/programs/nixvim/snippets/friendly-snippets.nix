{ delib, ... }:
delib.module {
  name = "programs.nixvim.snippits.friendly";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim = {
    plugins.friendly-snippets = {
      enable = true;
    };
  };
}
