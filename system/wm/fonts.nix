{ pkgs, ... }:

{
  # Fonts are nice to have
  fonts.packages = with pkgs; [
    # Fonts
    nerd-fonts.fira-code
    nerd-fonts.iosevka
    powerline
  ];

}
