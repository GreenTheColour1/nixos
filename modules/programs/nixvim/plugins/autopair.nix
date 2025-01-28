{ delib, ... }:
delib.module {
  name = "programs.nixvim.plugins.autopair";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim.plugins.autopair = {
    enable = true;
  };
}
