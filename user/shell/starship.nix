{pkgs, lib, config, ... }:
{
  home.packages = with pkgs; [
    starship
  ];

  programs.starship = {
    enable = true;
    package = pkgs.starship;
    settings = {
      format = lib.concatStrings [
        "[](color_orange)"
        "$os"
        "$username"
        "[](bg:color_yellow fg:color_orange)"
        "$directory"
        "[](fg:color_yellow bg:color_aqua)"
        "$git_branch"
        "$git_status"
        "[](fg:color_aqua bg:color_blue)"
        "$c"
        "$rust"
        "$golang"
        "$nodejs"
        "$php"
        "$java"
        "$kotlin"
        "$haskell"
        "$python"
        "[](fg:color_blue bg:color_bg3)"
        "$docker_context"
        "$conda"
        "[](fg:color_bg3 bg:color_bg1)"
        "$time"
        "[ ](fg:color_bg1)"
        "$line_break$charact"
      ];
      os = {
        disabled = false;
        symbols = { NixOS = "󱄅"; };
        style = "bg:color_orange fg:color_fg0";
      };
      username = {
        show_always = true;
        style_user = "bg:color_orange fg:color_fg0";
        style_root = "bg:color_orange fg:color_fg0";
        format = "[ $user ]($style)";
      };
      directory = {
        style = "fg:color_fg0 bg:color_yellow";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "../";
      };
      git_branch = {
        symbol = "";
        style = "bg:color_aqua";
        format = "[[ $symbol $branch ](fg:color_fg0 bg:color_aqua)]($style)";
      };
      git_status = {
        format = "[[ $symbol $branch ](fg:color_fg0 bg:color_aqua)]($style)";
        style = "[[($all_status$ahead_behind )](fg:color_fg0 bg:color_aqua)]($style)";

      };
      nodejs = {
        symbol = "";
        style = "";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };
      c = {
        symbol = " ";
        style = "";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };
      rust = {
        symbol = "";
        style = "";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };
      golang = {
        symbol = "";
        style = "";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };
      php = {
        symbol = "";
        style = "";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };
      java = {
        symbol = " ";
        style = "";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };
      kotlin = {
        symbol = "";
        style = "";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };
      haskell = {
        symbol = "";
        style = "";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };
      python = {
        symbol = "";
        style = "";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };
      docker_context = {
        symbol = "";
        style = "";
        format = "[[ $symbol( $context) ](fg:#83a598 bg:color_bg3)]($style)";
      };
      conda = {
        style = "";
        format = "[[ $symbol( $environment) ](fg:#83a598 bg:color_bg3)]($style)";
      };
      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:color_bg1";
        format = "[[  $time ](fg:color_fg0 bg:color_bg1)]($style)";
      };
      line_break = {
        disabled = false;
      };
      character = {
        disabled = false;
        success_symbol = "[](bold fg:color_green)";
        error_symbol = "[](bold fg:color_red)";
        vimcmd_symbol = "[](bold fg:color_green)";
        vimcmd_replace_one_symbol = "[](bold fg:color_purple)";
        vimcmd_replace_symbol = "[](bold fg:color_purple)";
        vimcmd_visual_symbol = "[](bold fg:color_yellow)";
      };
      palette = "custom";
      palettes.custom = {
        color_fg0 = "#${config.lib.stylix.colors.base07}";
        color_bg1 = "#${config.lib.stylix.colors.base01}";
        color_bg3 = "#${config.lib.stylix.colors.base03}";
        color_blue = "#${config.lib.stylix.colors.base0D}";
        color_aqua = "#${config.lib.stylix.colors.base0C}";
        color_green = "#${config.lib.stylix.colors.base0B}";
        color_orange = "#${config.lib.stylix.colors.base09}";
        color_purple = "#${config.lib.stylix.colors.base0E}";
        color_red = "#${config.lib.stylix.colors.base08}";
        color_yellow = "#${config.lib.stylix.colors.base0A}";
      };
    };
  };
}
