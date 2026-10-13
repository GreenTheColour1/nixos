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

  home.always.imports = [ inputs.nixvim.homeModules.nixvim ];

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        # Live perms are 0700 (swap files may contain file contents).
        {
          directory = ".local/share/nvim";
          mode = "0700";
        }
        ".local/state/nvim"
      ];
    };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.nixvim = {
        enable = true;
        inherit (cfg) defaultEditor;
        nixpkgs.source = inputs.nixpkgs;

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

  myconfig.ifEnabled.programs.zsh.aliases = [
    { v = "nvim"; }
  ];
}
