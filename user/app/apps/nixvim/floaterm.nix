{ ... }:
{
  programs.nixvim.plugins.floaterm = {
    enable = true;
    shell = "zsh";
    keymaps = {
      toggle = "<leader><CR>";
    };
  };
}
