{ ... }:
{
  programs.nixvim.plugins.floaterm = {
    enable = true;
    settings = {
      shell = "zsh";
      keymaps = {
        toggle = "<leader>T";
      };
    };
  };
}
