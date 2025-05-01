{
  delib,
  inputs,
  homeconfig,
  ...
}:
delib.module {
  name = "programs.nixvim";

  options.programs.nixvim = with delib; {
    enable = boolOption true;
    defaultEditor = boolOption true;
  };

  home.always.imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.nixvim = {
        enable = true;
        inherit (cfg) defaultEditor;

        clipboard.register = "unnamedplus";

        globals = {
          mapleader = " ";
          maplocalleader = " ";
        };

        opts = {
          number = true;
          relativenumber = true;

          list = true;

          expandtab = true;
          tabstop = 2;
          softtabstop = 2;
          shiftwidth = 2;

          ignorecase = true;
          smartcase = true;

          timeoutlen = 300;

          inccommand = "split";
          cursorline = true;
          scrolloff = 10;
          cmdheight = 0;

          termguicolors = true;
        };

        keymaps = [
          {
            action = "<cmd>nohlsearch<CR>";
            key = "<Esc>";
            options = {
              desc = "Clear search highlight";
            };
            mode = "n";
          }
        ];
      };
    };

  # myconfig.programs.zsh.aliases = {
  #   v = "nvim";
  # };
}
