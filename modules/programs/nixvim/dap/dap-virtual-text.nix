{ delib, ... }:
delib.module {
  name = "programs.nixvim.dap.dap-virtual-text";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim.plugins.dap-virtual-text = {
    enable = true;
  };
}
