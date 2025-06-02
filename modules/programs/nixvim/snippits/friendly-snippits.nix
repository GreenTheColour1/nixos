{ delib, ... }:
delib.module {
  name = "programs.nixvim.snippits.friendly";

  option = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim = {
    plugins.friendly-snippits = {
      enabled = true;
    };
  };
}
