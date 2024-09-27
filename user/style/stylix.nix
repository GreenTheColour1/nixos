{
  config,
  lib,
  pkgs,
  inputs,
  userSettings,
  ...
}:

let
  themePath = "../../../themes/" + userSettings.theme + "/" + userSettings.theme + ".yaml";
  themePolarity = "dark";
  wallpaperImage = ../../themes/wallpapers/latenight-urban.jpg;
in
{

  imports = [ inputs.stylix.homeManagerModules.stylix ];

  home.file.".currenttheme".text = userSettings.theme;
  stylix.enable = true;
  stylix.autoEnable = true;
  stylix.polarity = themePolarity;
  stylix.image = wallpaperImage;
  stylix.base16Scheme = ./. + themePath;

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

  stylix.targets.kitty.enable = true;
  stylix.targets.gtk.enable = true;
  stylix.targets.nixvim.enable = false;
  # stylix.targets.rofi.enable = if (userSettings.wmType == "x11") then true else false;
  # stylix.targets.feh.enable = if (userSettings.wmType == "x11") then true else false;
  # programs.feh.enable = true;
  # home.file.".fehbg-stylix".text = ''
  #   #!/bin/sh
  #   feh --no-fehbg --bg-fill ''+config.stylix.image+'';
  # '';
  # home.file.".fehbg-stylix".executable = true;
  # home.file = {
  #   ".config/qt5ct/colors/oomox-current.conf".source = config.lib.stylix.colors {
  #     template = builtins.readFile ./oomox-current.conf.mustache;
  #     extension = ".conf";
  #   };
  #   ".config/Trolltech.conf".source = config.lib.stylix.colors {
  #     template = builtins.readFile ./Trolltech.conf.mustache;
  #     extension = ".conf";
  #   };
  #   ".config/kdeglobals".source = config.lib.stylix.colors {
  #     template = builtins.readFile ./Trolltech.conf.mustache;
  #     extension = "";
  #   };
  #   ".config/qt5ct/qt5ct.conf".text = pkgs.lib.mkBefore (builtins.readFile ./qt5ct.conf);
  # };
  # home.file.".config/hypr/hyprpaper.conf".text = ''
  #   preload = ''+config.stylix.image+''
  #
  #   wallpaper = ,''+config.stylix.image+''
  #
  # '';
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
