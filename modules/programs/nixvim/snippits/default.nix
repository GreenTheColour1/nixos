{ delib, host, ... }:
delib.module {
  name = "programs.nixvim.snippits";

  option = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.programs.nixvim = {
    plugins.luasnip = {
      enabled = true;
    };

    keymaps = [
      {
        action.__raw = "function() require('luasnip').expand() end";
        key = "<C-K>";
        mode = "i";
        options = {
          silent = true;
        };
      }
      {
        action.__raw = "function() require('luasnip').jump(1) end";
        key = "<C-L>";
        mode = [
          "i"
          "s"
        ];
        options = {
          silent = true;
        };
      }
      {
        action.__raw = "function() require('luasnip').jump(-1) end";
        key = "<C-H>";
        mode = [
          "i"
          "s"
        ];
        options = {
          silent = true;
        };
      }
      {
        action.__raw = ''
          function()
            if require('luasnip').choice_active() then
              require('luasnip').change_choice(1)
          end
        '';
        key = "<C-E>";
        mode = [
          "i"
          "s"
        ];
        options = {
          silent = true;
        };
      }
    ];
  };
}
