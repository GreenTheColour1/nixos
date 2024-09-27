{ pkgs, ... }:

{
  hardware.graphics.enable32Bit = true;
  programs.steam.enable = true;
  programs.steam.protontricks.enable = true;
  programs.steam.protontricks.package = pkgs.protontricks;
  environment.systemPackages = [ pkgs.steam ];
}
