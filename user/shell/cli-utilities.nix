{ pkgs, inputs, ... }:
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
    microfetch
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
      vim_keys = true;
    };
    package = pkgs.btop.override { cudaSupport = true; };
  };

  # nix-index-database for comma
  imports = [ inputs.nix-index-database.hmModules.nix-index ];
  programs.nix-index-database.comma.enable = true;
}
