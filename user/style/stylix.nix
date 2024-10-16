{
  config,
  lib,
  pkgs,
  inputs,
  userSettings,
  ...
}:

let
  themePath = "${pkgs.base16-schemes}/share/themes/${userSettings.theme}.yaml";
  themePolarity = "dark";
  wallpaperImage = ../../themes/wallpapers/latenight-urban.jpg;
in
{

  imports = [ inputs.stylix.homeManagerModules.stylix ];

  home.file.".currenttheme".text = userSettings.theme;
  stylix.enable = true;
  stylix.autoEnable = false;
  stylix.polarity = themePolarity;
  stylix.image = wallpaperImage;
  stylix.base16Scheme = themePath;

  stylix.fonts = {
    monospace = {
      name = userSettings.font;
      package = userSettings.fontPkg;
    };
    serif = {
      name = userSettings.font;
      package = userSettings.fontPkg;
    };
    sansSerif = {
      name = userSettings.font;
      package = userSettings.fontPkg;
    };
    emoji = {
      name = "Noto Emoji";
      package = pkgs.noto-fonts-monochrome-emoji;
    };
    sizes = {
      terminal = 12;
      applications = 10;
      popups = 10;
      desktop = 10;
    };
  };

  stylix.targets = {
    gtk.enable = true;
    nixvim.enable = false;
    bat.enable = true;
    btop.enable = true;
    hyprland.enable = true;
    kitty.enable = true;
    lazygit.enable = true;
    rofi.enable = true;
    yazi.enable = true;
  };
  home.packages = with pkgs; [
    libsForQt5.qt5ct
    pkgs.libsForQt5.breeze-qt5
    libsForQt5.breeze-icons
    pkgs.noto-fonts-monochrome-emoji
  ];
  qt = {
    enable = true;
    style.package = pkgs.libsForQt5.breeze-qt5;
    style.name = "breeze-dark";
    platformTheme.name = "kde";
  };
  fonts.fontconfig.defaultFonts = {
    monospace = [ userSettings.font ];
    sansSerif = [ userSettings.font ];
    serif = [ userSettings.font ];
  };
}
