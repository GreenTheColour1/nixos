{ delib, ... }:
delib.module {
  name = "programs.nixvim.plugins.lualine";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim.plugins = {
    lualine = {
      enable = true;
      settings = {
        extentions = [
          "fugitive"
          "fzf"
          "toggleterm"
          "quickfix"
        ];
        globalstatus = true;
        sections = {
          lualine_c.__raw = ''
            {
                      { navic.getlocation, cond = navic.is_avaliable }
                    }'';
          lualine_y = [
            "filename"
            "path"
            "filestatus"
            "newfile_status"
          ];
          lualine_z.__raw = ''
            { 
                     { extra_mode_status }
                    }'';
        };
        options.theme = "gruvbox_dark";
      };
      luaConfig.pre = ''
        ---Indicators for special modes,
        ---@return string status
        local function extra_mode_status()
          -- recording macros
          local reg_recording = vim.fn.reg_recording()
          if reg_recording ~= "" then
            return ' @' .. reg_recording
          end
          -- executing macros
          local reg_executing = vim.fn.reg_executing()
          if reg_executing ~= "" then
            return ' @' .. reg_executing
          end
          -- ix mode (<C-x> in insert mode to trigger different builtin completion sources)
          local mode = vim.api.nvim_get_mode().mode
          if mode == 'ix' then
            return '^X: (^]^D^E^F^I^K^L^N^O^Ps^U^V^Y)'
          end
          return ""
        end

        local navic = require('nvim-navic')
      '';
    };
    navic = {
      enable = true;
      settings = {
        lsp = {
          auto_attach = true;
        };
      };
    };
  };
}
