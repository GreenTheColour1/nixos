{
  delib,
  host,
  homeconfig,
  pkgs,
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
    { cfg, ... }:
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
          defaultApplications = {
            "application/json" = "zen-beta.desktop";
            "application/pdf" = "zen-beta.desktop";
            "application/x-xpinstall" = "zen-beta.desktop";
            "application/xhtml+xml" = "zen-beta.desktop";
            "text/html" = "zen-beta.desktop";
            "text/xml" = "zen-beta.desktop";
            "x-scheme-handler/http" = "zen-beta.desktop";
            "x-scheme-handler/https" = "zen-beta.desktop";
          };
        };

        portal = {
          extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
          ];
        };
      };
    };
}
