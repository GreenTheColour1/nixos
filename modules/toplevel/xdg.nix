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
            "application/json" = "zen-twilight.desktop";
            "application/pdf" = "zen-twilight.desktop";
            "application/x-xpinstall" = "zen-twilight.desktop";
            "application/xhtml+xml" = "zen-twilight.desktop";
            "text/html" = "zen-twilight.desktop";
            "text/xml" = "zen-twilight.desktop";
            "x-scheme-handler/http" = "zen-twilight.desktop";
            "x-scheme-handler/https" = "zen-twilight.desktop";
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
