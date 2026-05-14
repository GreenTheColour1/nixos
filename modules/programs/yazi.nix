{
  delib,
  host,
  pkgs,
  ...
}:
let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "0897e20d41b79a5ec8e80e645b041bb950547a0b";
    hash = "sha256-tHOHWFH9E7aGrmHb8bUD1sLGU0OIdTjQ2p4SbJVfh/s=";
  };
in
delib.module {
  name = "programs.yazi";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled = {
    home.packages = with pkgs; [
      yazi
      mediainfo
      exiftool
      ffmpeg
    ];

    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      shellWrapperName = "y";

      settings = {
        mgr = {
          show_symlink = true;
        };
        plugin = {
          prepend_preloaders = [
            # Mediainfo
            {
              mime = "{audio,video,image}/*";
              run = "mediainfo";
            }
            {
              mime = "application/subrip";
              run = "mediainfo";
            }
            {
              url = "*.{ai,eps,ait}";
              run = "mediainfo";
            }
          ];
          prepend_previewers = [
            # Exiftool
            {
              mime = "*executable*";
              run = "exiftool";
            }
            # Mediainfo
            {
              mime = "{audio,video,image}/*";
              run = "mediainfo";
            }
            {
              mime = "application/subrip";
              run = "mediainfo";
            }
            {
              url = "*.{ai,eps,ait}";
              run = "mediainfo";
            }
          ];
        };
      };

      plugins = {
        chmod = "${yazi-plugins}/chmod.yazi";
        jump-to-char = "${yazi-plugins}/jump-to-char.yazi";
        wl-clipboard = pkgs.fetchFromGitHub {
          owner = "grappas";
          repo = "wl-clipboard.yazi";
          rev = "8cc55242dbbc0b60fde27ab0d17bf11d91a14e14";
          hash = "sha256-pIKxWhaVDUOUKvVL4hGXn5zT4K7AvDi/VM+zBCX+19c=";
        };
        exiftool = pkgs.fetchFromGitHub {
          owner = "AleMenon";
          repo = "exiftool.yazi";
          rev = "4c35573f81e62c4c21f3baf9cdb5b93015f1870a";
          hash = "sha256-vEhOyPlBzYOT7U98w0lhq7SS36lBv71c3ESCAuFqTfc=";
        };
        mediainfo = pkgs.fetchFromGitHub {
          owner = "boydaihungst";
          repo = "mediainfo.yazi";
          rev = "49f5ab722d617a64b3bea87944e3e4e17ba3a46b";
          hash = "sha256-PcGrFG06XiJYgBWq+c7fYsx1kjkCvIYRaBiWaJT+xkw=";
        };
      };

      keymap = {
        mgr.prepend_keymap = [
          {
            on = [
              "c"
              "m"
            ];
            run = "plugin chmod";
            desc = "Chmod on selected files";
          }
          {
            on = "<C-y>";
            run = "plugin wl-clipboard";
            desc = "Copy to system clipboard";
          }
          {
            on = "f";
            run = "plugin jump-to-char";
            desc = "Jump to char";
          }
        ];
      };
    };
  };
}
