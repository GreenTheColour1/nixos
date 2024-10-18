{
  config,
  pkgs,
  pkgs-stable,
  userSettings,
  systemSettings,
  inputs,
  ...
}:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/" + userSettings.username;

  imports = [
    ../../user/app/git/git.nix # Git config
    ../../user/shell/sh.nix # zsh and bash config
    ../../user/style/stylix.nix
    (./. + "../../../user/wm" + ("/" + userSettings.wm) + ".nix") # window manager selected from flake
    ../../user/app/apps/nixvim/nixvim.nix
    ../../user/app/terminal/yazi.nix
    ../../user/app/media/spotify.nix
    ../../user/app/social/disord.nix
    ../../user/app/apps/obs.nix
  ];

  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = (
    with pkgs;
    [
      # Core
      zsh
      kitty
      inputs.zen-browser.packages."${systemSettings.system}".specific
      brave
      git
      gh
      stow
      killall
      nemo

      # Dev
      unzip
      ripgrep

      # dolphin-emu

      # Work
      hubstaff
    ]
  );

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    music = "${config.home.homeDirectory}/Media/Music";
    videos = "${config.home.homeDirectory}/Media/Videos";
    pictures = "${config.home.homeDirectory}/Media/Pictures";
    templates = "${config.home.homeDirectory}/Templates";
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    desktop = null;
    publicShare = null;
    extraConfig = {
      XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
      XDG_ARCHIVE_DIR = "${config.home.homeDirectory}/Archive";
      XDG_VM_DIR = "${config.home.homeDirectory}/Machines";
      XDG_ORG_DIR = "${config.home.homeDirectory}/Org";
      XDG_PODCAST_DIR = "${config.home.homeDirectory}/Media/Podcasts";
      XDG_BOOK_DIR = "${config.home.homeDirectory}/Media/Books";
    };
  };
  xdg.mime.enable = true;
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/json" = "zen.desktop";
      "application/pdf" = "zen.desktop";
      "application/x-xpinstall" = "zen.desktop";
      "application/xhtml+xml" = "zen.desktop";
      "text/html" = "zen.desktop";
      "text/xml" = "zen.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
    };
  };

  # For Virt-manager
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
