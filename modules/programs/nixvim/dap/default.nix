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
    };
    keymaps = [
      {
        action.__raw = "require('dap').toggle_breakpoint()";
        key = "<leader>db";
        mode = "n";
        options = {
          desc = "[D]ebug set [B]reakpoint";
          silent = true;
        };
      }
      {
        action.__raw = "require('dap').continue()";
        key = "<leader>dc";
        mode = "n";
        options = {
          desc = "[D]ebug [c]ontinue";
          silent = true;
        };
      }
      {
        action.__raw = "require('dap').step_over()";
        key = "<leader>do";
        mode = "n";
        options = {
          desc = "[D]ebug step [o]ver";
          silent = true;
        };
      }
      {
        action.__raw = "require('dap').step_into()";
        key = "<leader>di";
        mode = "n";
        options = {
          desc = "[D]ebug step [i]nto";
          silent = true;
        };
      }
      {
        action.__raw = "require('dap').step_out()";
        key = "<leader>dO";
        mode = "n";
        options = {
          desc = "[D]ebug step [O]ut";
          silent = true;
        };
      }
      {
        action.__raw = "require('dap').terminate()";
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
