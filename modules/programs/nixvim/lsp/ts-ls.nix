{ delib, ... }:
delib.module {
  name = "programs.nixvim.lsp.ts-ls";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim.plugins.lsp.servers.ts-ls = {
    enable = true;
  };
}
