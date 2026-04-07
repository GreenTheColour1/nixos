{ delib, ... }:
delib.module {
  name = "programs.nixvim.plugins.fidget";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim.plugins.fidget = {
    enable = true;
  };
}
