{ pkgs, ... }:

{
  hardware.graphics.enable32Bit = true;
  programs.steam = {
    enable = true;

    extraCompatPackages = with pkgs; [ proton-ge-bin ];

    protontricks.enable = true;
    protontricks.package = pkgs.protontricks;

    gamescopeSession.enable = true;
  };
  environment.systemPackages = [ pkgs.steam ];
}
