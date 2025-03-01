{ delib, ... }:
delib.module {
  name = "programs.nixvim.lsp.gopls";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim.plugins.lsp.servers.gopls = {
    enable = true;
  };
}
