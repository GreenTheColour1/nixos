{
  inputs,
  pkgs,
  lib,
  ...
}:
let
  pkgs-hyprland = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    ./wayland.nix
    ./pipewire.nix
    ./dbus.nix
  ];

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
