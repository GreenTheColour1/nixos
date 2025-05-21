{ delib, ... }:
delib.module {
  name = "programs.nixvim.dap.dap-go";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim.plugins.dap-go = {
    enable = true;
  };
}
