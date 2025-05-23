{
  delib,
  pkgs,
  lib,
  ...
}:
delib.module {
  name = "programs.nixvim.dap.dap-vscode-js";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.nvim-dap-vscode-js ];
    extraConfigLua = ''
      require('dap-vscode-js').setup({})
    '';
  };
}
