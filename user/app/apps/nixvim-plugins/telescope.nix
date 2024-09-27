{ ... }:
{
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>sh" = {
        action = "help_tags";
        options = { desc = "[S]earch [H]elp"; };
      };
      "<leader>sf" = {
        action = "find_files";
        options = { desc = "[S]earch [F]iles"; };
      };
      "<leader>sg" = {
        action = "live_grep";
        options = { desc = "[S]earch [G]rep"; };
      };
      "<leader>s." = {
        action = "oldfiles";
        options = { desc = "[S]earch recent files"; };
      };
    };

    settings = {
      defaults = {
        path_display = [ "truncate" ];
        layout_strategy = "vertical";
        layout_config.__raw = "layout_config";
        preview = { treesitter = true; };
        history = {
          path.__raw = "vim.fn.stdpath('data') .. '/telescope_history.sqlite3'";
          limit = 1000;
        };
        color_devicons = true;
        set_env.__raw = "{ ['COLORTERM'] = 'truecolor' }";
        prompt_prefix = "   ";
        selection_caret = "  ";
        entry_prefix = "  ";
        initial_mode = "insert";
        vimgrep_arguments = [
          "rg"
          "-L"
          "--color=never"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
          "--smart-case"
        ];
      };
      extentions = {
        fzy_native = {
          override_generic_sorter = false;
          override_file_sorter = true;
        };
      };
    };

    luaConfig.pre = ''
      local layout_config = {
        vertical = {
          width = function(_, max_columns)
            return math.floor(max_columns * 0.99)
          end,
          height = function(_, _, max_lines)
            return math.floor(max_lines * 0.99)
          end,
          prompt_position = 'bottom',
          preview_cutoff = 0,
        },
      }
    '';

    extensions.fzf-native.enable = true;
    extensions.ui-select.enable = true;
  };

  programs.nixvim.plugins.web-devicons = {
    enable = true;
  };
}
