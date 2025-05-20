{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.tmux";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled = {
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      mouse = true;
      newSession = true;
      escapeTime = 0;

      prefix = "C-a";

      shell = "${pkgs.zsh}/bin/zsh";
      terminal = "\${TERM}";

      keyMode = "vi";

      extraConfig = ''
        set -g renumber-windows on
        set-option -sa terminal-overrides ",xterm*:Tc"

        unbind %
        bind \\ split-window -h

        unbind \"
        bind - split-window -v

        bind K kill-session

        # Vim like pane navigation
        bind-key h select-pane -L
        bind-key j select-pane -D
        bind-key k select-pane -U
        bind-key l select-pane -R
      '';

      plugins = with pkgs; [
        {
          plugin = tmuxPlugins.gruvbox;
        }
      ];
    };
  };
}
