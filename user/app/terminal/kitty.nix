{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];
  programs.kitty.enable = true;
  programs.kitty.settings = {
    modify_font = "cell_width 90%";
    enable_audio_bell = "no";

    sync_to_monito = "no";
  };
}
