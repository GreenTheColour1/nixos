{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.yazi";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled = {
    home.packages = with pkgs; [ yazi ];

    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        mgr = {
          show_hidden = true;
          show_symlink = true;
        };
      };
    };
  };
  myconfig.ifEnabled.programs.zsh.aliases = [
    { y = "yazi"; }
  ];
}
