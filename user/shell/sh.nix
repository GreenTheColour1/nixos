{ pkgs, ... }:
let

  myAliases = {
    ".." = "cd ..";
    ls = "eza --icons -l";
    v = "nvim";
  };
in
{
  imports = [ ./cli-utilities.nix ./starship.nix ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
    initExtra = "pfetch";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  home.packages = with pkgs; [
    gnugrep eza
    direnv nix-direnv
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}

