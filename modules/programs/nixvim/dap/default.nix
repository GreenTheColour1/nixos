{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.nixvim.dap";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.programs.nixvim = {
    plugins.dap = {
      enable = true;

      # configurations = {
      #   javascript = [
      #     # NodeJS
      #     {
      #       type = "pwa-node";
      #       request = "launch";
      #       name = "Launch file";
      #       program = "\${file}";
      #       cwd = "\${workspaceFolder}";
      #     }
      #     {
      #       type = "pwa-node";
      #       request = "attach";
      #       name = "Attach";
      #       processId.__raw = "require'dap.utils'.pick_process";
      #       cwd = "\${workspaceFolder}";
      #
      #     }
      #     {
      #       # Jest
      #       type = "pwa-node";
      #       request = "launch";
      #       name = "Debug Just Tests";
      #       runtimeExcecutable = "node";
      #       runtimeArgs = [
      #         "./node_modules/jest/bin/jest.js"
      #         "--runInBand"
      #       ];
      #       rootPath = "\${workspaceFolder}";
      #       cwd = "\${workspaceFolder}";
      #       console = "integratedTerminal";
      #       internalConsoleOptions = "neverOpen";
      #     }
      #   ];
      # };

      signs = {
        dapBreakpoint = {
          text = "";
          texthl = "DiagnosticsSignError";
          linehl = "";
          numhl = "";
        };
        dapBreakpointRejected = {
          text = "";
          texthl = "DiagnosticSignError";
          linehl = "";
          numhl = "";
        };
        dapStopped = {
          text = "";
          texthl = "DiagnosticSignWarn";
          linehl = "Visual";
          numhl = "DiagnosticSignWarn";
        };
      };
      # luaConfig.post = ''
      #   local dap = require("dap")
      #   -- Automatically open/close DAP UI
      #   dap.listeners.after.event_initialized["dapui_config"] = function()
      #     require('dapui').open()
      #   end
      # '';
    };
    keymaps = [
      {
        action.__raw = "function() require('dap').toggle_breakpoint() end";
        key = "<leader>db";
        mode = "n";
        options = {
          desc = "[D]ebug set [B]reakpoint";
          silent = true;
        };
      }
      {
        action.__raw = "function() require('dap').continue() end";
        key = "<leader>dc";
        mode = "n";
        options = {
          desc = "[D]ebug [c]ontinue";
          silent = true;
        };
      }
      {
        action.__raw = "function() require('dap').step_over() end";
        key = "<leader>do";
        mode = "n";
        options = {
          desc = "[D]ebug step [o]ver";
          silent = true;
        };
      }
      {
        action.__raw = "function() require('dap').step_into() end";
        key = "<leader>di";
        mode = "n";
        options = {
          desc = "[D]ebug step [i]nto";
          silent = true;
        };
      }
      {
        action.__raw = "function() require('dap').step_out() end";
        key = "<leader>dO";
        mode = "n";
        options = {
          desc = "[D]ebug step [O]ut";
          silent = true;
        };
      }
      {
        action.__raw = "function() require('dap').terminate() end";
        key = "<leader>dq";
        mode = "n";
        options = {
          desc = "[D]ebug [q]uit";
          silent = true;
        };
      }
    ];
  };
}
