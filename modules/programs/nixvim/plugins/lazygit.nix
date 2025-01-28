{ delib, ... }:
delib.module {
  name = "programs.nixvim.plugins.lazygit";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim = {
    plugins.lazygit = {
      enable = true;
    };

    keymaps = [
      {
        action = "<cmd>LazyGit<cr>";
        key = "<leader>lg";
        options = {
          desc = "[L]azy[G]it";
        };
      }
    ];
  };
}
