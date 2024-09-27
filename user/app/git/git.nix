{ config, pkgs, userSettings, ... }:

{
  home.packages = [ pkgs.git pkgs.lazygit ];
  programs.git.enable = true;
  programs.git.userName = userSettings.name;
  programs.git.userEmail = userSettings.email;
}
