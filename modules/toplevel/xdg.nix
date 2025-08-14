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
            pkgs.xdg-desktop-portal-gtk
            (lib.mkIf myconfig.programs.niri.enable pkgs.xdg-desktop-portal-gnome)
          ];
        };
      };
    };
}
