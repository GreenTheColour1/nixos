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
    ../../user/app/apps/nixvim.nix
    ../../user/app/terminal/yazi.nix
    ../../user/app/media/spotify.nix
    ../../user/app/social/disord.nix
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
      firefox
      inputs.zen-browser.packages."${systemSettings.system}".specific
      brave
      git
      gh
      stow
      killall

      #games
      runelite

      # Dev
      unzip
      ripgrep
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

    associations.added = {
      "x-scheme-handler/http" = "userapp-Zen Browser-7X8WU2.desktop";
      "x-scheme-handler/https" = "userapp-Zen Browser-7X8WU2.desktop";
      "x-scheme-handler/chrome" = "userapp-Zen Browser-7X8WU2.desktop";
      "text/html" = "userapp-Zen Browser-7X8WU2.desktop";
      "application/x-extension-htm" = "userapp-Zen Browser-7X8WU2.desktop";
      "application/x-extension-html" = "userapp-Zen Browser-7X8WU2.desktop";
      "application/x-extension-shtml" = "userapp-Zen Browser-7X8WU2.desktop";
      "application/xhtml+xml" = "userapp-Zen Browser-7X8WU2.desktop";
      "application/x-extension-xhtml" = "userapp-Zen Browser-7X8WU2.desktop";
      "application/x-extension-xht" = "userapp-Zen Browser-7X8WU2.desktop";
    };

    defaultApplications = {
      "x-scheme-handler/http" = "userapp-Zen Browser-7X8WU2.desktop";
      "x-scheme-handler/https" = "userapp-Zen Browser-7X8WU2.desktop";
      "x-scheme-handler/chrome" = "userapp-Zen Browser-7X8WU2.desktop";
      "text/html" = "userapp-Zen Browser-7X8WU2.desktop";
      "application/x-extension-htm" = "userapp-Zen Browser-7X8WU2.desktop";
      "application/x-extension-html" = "userapp-Zen Browser-7X8WU2.desktop";
      "application/x-extension-shtml" = "userapp-Zen Browser-7X8WU2.desktop";
      "application/xhtml+xml" = "userapp-Zen Browser-7X8WU2.desktop";
      "application/x-extension-xhtml" = "userapp-Zen Browser-7X8WU2.desktop";
      "application/x-extension-xht" = "userapp-Zen Browser-7X8WU2.desktop";
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/fishy/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
