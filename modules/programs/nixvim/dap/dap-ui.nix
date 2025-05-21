{ delib, host, ... }:
delib.module {
  name = "programs.nixvim.dap.dap-ui";

  options = delib.singleEnableOption true;

  home.ifEnabled.nixvim = {
    plugins.dap-ui = {
      enabled = true;
    };

    keybinds = [
      {
        action.__raw = "require('dapui').toggle()";
        key = "<leader>du";
        mode = "n";
        options = {
          desc = "[D]ebug toggle [u]i";
          silent = true;
        };
      }
    ];
  };
}
