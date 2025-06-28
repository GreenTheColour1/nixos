{ delib, ... }:
delib.module {
  name = "programs.nixvim.lsp.dockerls";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim.plugins.lsp.servers.dockerls = {
    enable = true;
  };
}
