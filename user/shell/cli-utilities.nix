{ pkgs, ... }:
{
  # Collection of useful CLI apps
  home.packages = with pkgs; [
    # Command Line
    killall
    gnugrep
    bat
    eza
    ripgrep
    unzip
    hwinfo
    pfetch-rs
    btop
    htop
    fastfetch
  ];

  programs.htop = {
    enable = true;
  };

  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
    };
  };

  programs.yazi = {
    enable = true;
    settings = {
      show_hidden = true;
      show_symlink = true;
    };
  };
}
