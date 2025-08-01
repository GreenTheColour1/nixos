{ delib, ... }:
delib.module {
  name = "programs.nixvim.lsp.tailwindcss";

  options = delib.singleEnableOption false;

  home.ifEnabled.programs.nixvim.plugins.lsp.servers.tailwindcss = {
    enable = true;
  };
}
