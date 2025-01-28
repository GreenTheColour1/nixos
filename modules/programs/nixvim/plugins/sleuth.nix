{ delib, ... }:
delib.module {
  name = "programs.nixvim.plugins.sleuth";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim.plugins.sleuth = {
    enable = true;
  };
}
