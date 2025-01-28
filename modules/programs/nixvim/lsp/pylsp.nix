{ delib, ... }:
delib.module {
  name  = "programs.nixvim.lsp.pylsp";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim.plugins.lsp.servers.pyslp = {
    enable = true;
  };
}
