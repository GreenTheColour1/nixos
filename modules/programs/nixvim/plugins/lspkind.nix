{ delib, ... }:
delib.module {
  name = "programs.nixvim.plugins.lspkind";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim.plugins.lspkind = {
    enable = true;
    settings = {
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
}
