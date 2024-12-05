{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    extraConfig = {
      modi = "drun";
      columns = 1;
      lines = 5;
      show-icons = true;
      terminal = "kitty";
      drun-display-format = "{icon} {name}";
      seperator-style = "style";
      matching = "fuzzy";
    };
  };
}
