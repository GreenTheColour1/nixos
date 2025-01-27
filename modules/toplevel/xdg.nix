{
  delib,
  host,
  homeconfig,
  ...
}:
delib.module {
  name = "xdg";

  options.xdg = with delib; {
    enable = boolOption host.isDesktop;
    mime = {
      recommended = attrsOfOption (listOf str) {};
      associations = attrsOfOption (listOf str) {};
      removed = attrsOfOption (listOf str) {};
    };
  };

  home.ifEnabled = { cfg, ... }: {
    xdg = {
      enable = true;

      userDirs = let
        download = "${homeconfig.home.homeDirectory}/Downloads";
        media = category: "${homeconfig.home.homeDirectory}/Media/${category}";
      in {
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
    };
  };
}
