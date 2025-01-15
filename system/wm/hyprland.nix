{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./wayland.nix
    ./pipewire.nix
    ./dbus.nix
  ];

  services.gnome.gnome-keyring.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    withUWSM = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
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
