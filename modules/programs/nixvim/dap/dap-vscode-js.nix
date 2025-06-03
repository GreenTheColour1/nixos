{
  delib,
  pkgs,
  lib,
  ...
}:
delib.module {
  name = "programs.nixvim.dap.dap-vscode-js";

  options = delib.singleEnableOption true;

  home.ifEnabled = {
    programs.nixvim = {
      extraPlugins = [ pkgs.vimPlugins.nvim-dap-vscode-js ];
      extraConfigLua = ''
        local dap = require("dap")
        local dap_vscode_js = require("dap-vscode-js")
        local languages = { "javascript" }

        dap_vscode_js.setup({
          debugger_path = "${pkgs.vscode-js-debug}", 
          adapters = { 'pwa-node' }
        })

        dap.adapters['pwa-node'] = {
          type = 'server',
          host = 'localhost',
          port = "''${port}",
          executable = {
            command = '${pkgs.vscode-js-debug}/bin/js-debug',
            args = {
              "''${port}"
            },
          },
        }


        dap.configurations['javascript'] = {
          {
            name = "Launch File",
            type = "pwa-node",
            request = "launch",
            program = "''${file}",
            cwd = "''${workspaceFolder}",
            args = { "''${file}" },
            sourceMaps = true,
            sourceMapPathOverrides = {
              ["./*"] = "''${workspaceFolder}/dist/*"
            },
          },
          {
            name = "Attach",
            type = "pwa-node",
            request = "attach",
            processId = require'dap.utils'.pick_process,
            cwd = "''${workspaceFolder}",
            args = { "''${file}" },
            sourceMaps = true,
            sourceMapPathOverrides = {
              ["./*"] = "''${workspaceFolder}/dist/*"
            },
          },
          {
            name = "Debug jest tests",
            type = "pwa-node",
            request = "launch",
            runtimeArgs = {
              './node_modules/jest/bin/jest.js',
              '--runInBand',
            },
            console = 'integratedTerminal',
            internalConsoleOptions = 'neverOpen',
            cwd = "''${workspaceFolder}",
            args = { "''${file}" },
            sourceMaps = true,
            sourceMapPathOverrides = {
              ["./*"] = "''${workspaceFolder}/dist/*"
            },
          },
        }
      '';
    };
  };
}
