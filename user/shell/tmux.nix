{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "C-Space";
    baseIndex = 1;

    shell = "${pkgs.zsh}/bin/sh";
    extraConfig = ''
      unbind %
      bind \\ split-window -h

      unbind \"
      bind - split-window -v

      bind K kill-session

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
    '';
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.gruvbox;
        extraConfig = "set -g @tmux-gruvbox 'dark'";
      }
    ];

    sensibleOnTop = false;
  };
}
