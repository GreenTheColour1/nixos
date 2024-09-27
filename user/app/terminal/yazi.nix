{ pkgs, ... }:
{
  home.packages = with pkgs; [
    yazi
  ];

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };
}
