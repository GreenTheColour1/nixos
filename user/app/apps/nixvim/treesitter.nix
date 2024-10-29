{ pkgs, ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    nixvimInjections = true;

    settings = {
      highlight = {
        enable = true;
      };
      indent = {
        enable = true;
      };
    };

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      nix
      bash
      json
      lua
      regex
      xml
      yaml
      python
    ];
  };
}
