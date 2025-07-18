{ delib, ... }:
delib.module {
  name = "programs.nixvim.lsp";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim.plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
    };
    lsp-format = {
      enable = true;
    };
  };
}
