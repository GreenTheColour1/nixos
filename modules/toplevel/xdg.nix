{
  delib,
  host,
  homeconfig,
  pkgs,
  lib,
  ...
}:
delib.module {
  name = "xdg";

  options.xdg = with delib; {
    enable = boolOption host.isDesktop;
    mime = {
      recommended = attrsOfOption (listOf str) { };
      associations = attrsOfOption (listOf str) { };
      removed = attrsOfOption (listOf str) { };
    };
  };

  # Bulk home skeleton + unowned app strays, centralized here because xdg
  # owns the user-dirs definitions. Per-app state stays in its own module;
  # entries below are either XDG dirs or state with no owning module.
  # Caches, HM-managed config and regenerable files are never listed.
  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username} = {
        directories = [
          # XDG skeleton (see userDirs in home.ifEnabled above)
          "Documents"
          "Media"
          "Projects"
          "Downloads"
          "Machines"
          "nix-config"
          "Templates"
          "Org"
          # No owning module (strays); paths verified on the live system.
          # Re-audit with: ls ~ ~/.config ~/.local/share ~/.local/state
          ".config/autostart"
        ];
      };
    };

  home.ifEnabled =
    { myconfig, ... }:
    {
      xdg = {
        enable = true;

        userDirs =
          let
            download = "${homeconfig.home.homeDirectory}/Downloads";
            media = category: "${homeconfig.home.homeDirectory}/Media/${category}";
          in
          {
            enable = true;
            createDirectories = true;
            setSessionVariables = true;

            download = download;
            pictures = media "Pictures";
            music = media "Music";
            videos = media "Videos";
            templates = "${homeconfig.home.homeDirectory}/Templates";
            documents = "${homeconfig.home.homeDirectory}/Documents";
            desktop = null;
            publicShare = null;
          };

        mime.enable = true;
        mimeApps = {
          enable = true;
          defaultApplications =
            let
              browserBin = myconfig.programs.browser.defaultBrowserBin;
            in
            {
              "application/json" = "${browserBin}.desktop";
              "application/pdf" = "${browserBin}.desktop";
              "application/x-xpinstall" = "${browserBin}.desktop";
              "application/xhtml+xml" = "${browserBin}.desktop";
              "text/html" = "${browserBin}.desktop";
              "text/xml" = "${browserBin}.desktop";
              "x-scheme-handler/http" = "${browserBin}.desktop";
              "x-scheme-handler/https" = "${browserBin}.desktop";
            };
        };

        portal = {
          enable = true;
          extraPortals = [
            (lib.mkIf myconfig.programs.niri.enable pkgs.xdg-desktop-portal-gnome)
            pkgs.xdg-desktop-portal-gtk
          ];

          config.common.default = "*";
        };
      };
    };
}
