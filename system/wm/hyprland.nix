{ inputs, pkgs, lib, ... }: let
  pkgs-hyprland = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [ ./wayland.nix
              ./pipewire.nix
              ./dbus.nix
            ];

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  services.gnome.gnome-keyring.enable = true;

  programs.hyprland = {
    enable = true;
    package = pkgs-hyprland.hyprland;
    xwayland = {
      enable = true;
    };
    portalPackage = pkgs-hyprland.xdg-desktop-portal-hyprland;
  };

  # xdg.portal = {
  #   enable = true;
  #   xdgOpenUsePortal= true;
  #   config = {
  #     # common.default = ["gtk"];
  #     hyprland.default = ["hyprland"];
  #   };
  #
  #   extraPortals = [
  #     # pkgs.xdg-desktop-portal-gtk
  #   ];
  # };

  services.xserver.excludePackages = [ pkgs.xterm ];
}
