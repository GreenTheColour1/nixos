{ delib, ... }:
delib.module {
  name = "programs.nixvim.plugins.lsp-lines";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim = {
    plugins.lsp-lines = {
      enable = true;
    };

    diagnostic.settings = {
      virtual_text = false;
      virtual_lines = true;
    };
  };
}
