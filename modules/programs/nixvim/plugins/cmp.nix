{ delib, ... }:
delib.module {
  name = "programs.nixvim.plugins.cmp";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim = {
    plugins.cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          {
            name = "nvim_lsp";
            keyword_length = 3;
          }
          { name = "path"; }
          { name = "buffer"; }
          { name = "luasnip"; }
        ];
        experimental = {
          native_menu = false;
          ghost_text = true;
        };
        completion.completeopt = "menu,menuone,noselect";

        snippit.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';

        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-y>" = "cmp.mapping.confirm { select = true }";
          # Manually trigger completion
          "<C-Space>" = "cmp.mapping.complete {}";
        };
      };
    };

    plugins.cmp_luasnip.enable = true;
    plugins.cmp-nvim-lsp.enable = true;
    plugins.cmp-path.enable = true;
    plugins.cmp-buffer.enable = true;
    plugins.cmp-nvim-lsp-signature-help.enable = true;
    plugins.cmp-nvim-lua.enable = true;

    extraConfigLua = ''
      local cmp = require'cmp'

      cmp.setup.filetype('lua', {
        sources = cmp.config.sources {
          { name = 'nvim_lua' },
          { name = 'nvim_lsp', keyword_length = 3 },
          { name = 'path' },
        }
      })

      cmp.setup.cmdline({'/', '?'}, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources {
          { name = 'cmdline' },
          { name = 'path' }
        }
      })
    '';
  };
}
