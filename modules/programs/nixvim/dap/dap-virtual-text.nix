{ delib, ... }:
delib.module {
  name = "programs.nixvim.dap.dap-virtual-text";

  options = delib.singleEnabledOption true;

  home.ifEnabled.programs.nixvim.plugins.dap-virtual-text = {
    enable = true;
  };
}
