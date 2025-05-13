{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.nvim.plugins.harpoon";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim = {
    plugins.harpoon = {
      enable = true;
      enableTelescope = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>a";
        action.__raw = "function() require'harpoon':list():add() end";
      }
      {
        mode = "n";
        key = "<C-h>";
        action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
      }
      {
        mode = "n";
        key = "<leader>1";
        action.__raw = "function() require'harpoon':list():select(1) end";
      }
      {
        mode = "n";
        key = "<leader>2";
        action.__raw = "function() require'harpoon':list():select(2) end";
      }
      {
        mode = "n";
        key = "<leader>3";
        action.__raw = "function() require'harpoon':list():select(3) end";
      }
      {
        mode = "n";
        key = "<leader>4";
        action.__raw = "function() require'harpoon':list():select(4) end";
      }
    ];
  };
}
