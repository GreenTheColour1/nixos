{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./cmp.nix
    ./lsp.nix
    ./treesitter.nix
    ./telescope.nix
    ./lualine.nix
    ./oil.nix
    ./which-key.nix
    ./indent-blankline.nix
    ./mini.nix
    ./conform.nix
    ./nvim-colorizer.nix
    ./autopair.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    clipboard.register = "unnamedplus";

    # Neovim Options

    # Globals
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    # Opts
    opts = {
      number = true;
      relativenumber = true;
      mouse = "a";
      showmode = false;
      breakindent = true;
      undofile = true;

      # Case insensitive searching
      ignorecase = true;
      smartcase = true;

      signcolumn = "yes";
      updatetime = 250;

      # Decrease mapped sequence wait time
      # Displays which-key popup sooner
      timeoutlen = 300;

      splitright = true;
      splitbelow = true;

      list = true;
      listchars = {
        tab = "» ";
        trail = "·";
        nbsp = "␣";
      };
      inccommand = "split";
      cursorline = true;
      scrolloff = 10;
      cmdheight = 0;

      expandtab = true;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
    };

    # Color Scheme
    colorschemes.gruvbox.enable = true;

    plugins = {
      lazygit.enable = true;
      sleuth.enable = true;
    };

    keymaps = [
      {
        action = "<cmd>LazyGit<cr>";
        key = "<leader>lg";
        options = {
          desc = "[L]azy[G]it";
        };
      }
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
}
