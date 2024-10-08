{ lib, ... }:
{
  # CMP
  programs.nixvim.plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      sources = [
        { name = "nvim_lsp"; keyword_length = 3; }
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

  programs.nixvim.plugins = {
    cmp_luasnip.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp-buffer.enable = true;
    cmp-nvim-lsp-signature-help.enable = true;
    cmp-nvim-lua.enable = true;
    lspkind = {
      enable = true;
      mode = "symbol_text";
      extraOptions.with_text = true;
      cmp = {
        enable = true;
        ellipsisChar = "...";
        maxWidth = 50;
        menu = {
          buffer = "[BUF]";
          nvim_lsp = "[LSP]";
          nvim_lsp_signature_help = "[LSP]";
          nvim_lsp_document_symbol = "[LSP]";
          nvim_lua = "[API]";
          path = "[PATH]";
          luasnip = "[SNIP]";
        };
      };
    };
  };

  programs.nixvim.extraConfigLua = ''
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
}
