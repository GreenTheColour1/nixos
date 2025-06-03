{ delib, host, ... }:
delib.module {
  name = "programs.nixvim.dap.dap-ui";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim = {
    plugins.dap-ui = {
      enable = true;

      luaConfig.post = ''
        require('dap').listeners.after.event_initialized["dapui_config"] = function()
          require('dapui').open()
        end
      '';
    };

    keymaps = [
      {
        action.__raw = "function() require('dapui').toggle() end";
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
