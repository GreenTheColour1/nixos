{ config, pkgs, userSettings, ... }:

{
  imports = [ ./pipewire.nix
              ./dbus.nix
              ./gnome-keyring.nix
              ./fonts.nix
            ];

  environment.systemPackages = with pkgs;
    [ wayland ];

  # Configure xwayland
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
      options = "caps:escape";
    };
  };

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.sddm;
    };
    autoLogin.enable = true;
    autoLogin.user = userSettings.username;
  };
}
