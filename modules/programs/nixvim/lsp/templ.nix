{ delib, ... }:
delib.module {
  name = "programs.nixvim.lsp.templ";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim.plugins.lsp.servers.templ = {
    enable = true;
  };
}
