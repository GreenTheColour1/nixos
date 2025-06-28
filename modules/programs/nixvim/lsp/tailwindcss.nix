{ delib, ... }:
delib.module {
  name = "programs.nixvim.lsp.tailwindcss";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim.plugins.lsp.servers.tailwindcss = {
    enable = true;
  };
}
