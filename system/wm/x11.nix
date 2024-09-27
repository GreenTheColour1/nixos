{ pkgs, userSettings, ... }:

{
  imports = [ ./pipewire.nix
              ./dbus.nix
              ./gnome-keyring.nix
              ./fonts.nix
            ];

  # Configure X11
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    xkbOptions = "caps:escape";
    displayManager = {
      autoLogin.enable = true;
      autoLogin.user = userSettings.username;
    };
    libinput = {
      touchpad.disableWhileTyping = true;
    };
  };
}
