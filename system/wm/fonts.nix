{ pkgs-stable, ... }:

{
  # Fonts are nice to have
  fonts.packages = with pkgs-stable; [
    # Fonts
    fira-code
    fira-code-symbols
    powerline
  ];

}
