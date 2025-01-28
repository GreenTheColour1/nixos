{ delib, ... }:
delib.module {
  name = "programs.nixvim.lsp.lua_ls";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim.plugins.lsp.servers.lua_ls = {
    enable = true;
  };
}
