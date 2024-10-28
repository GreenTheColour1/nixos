{
  pkgs,
  lib,
  systemSettings,
  userSettings,
  inputs,
  ...
}:
{
  nix.settings = {
    substituters = [
      "https://ezkea.cachix.org"
    ];
    trusted-public-keys = [
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
    ];
  };

  imports = [
    # Include the results of the hardware scan.
    ../../system/hardware-configuration.nix
    ../../system/hardware/nvidia.nix
    (./. + "../../../system/wm" + ("/" + userSettings.wm) + ".nix") # My window manager
    ../../system/style/stylix.nix
    ../../system/hardware/bluetooth.nix
    ../../system/app/nix-helper.nix # Nix commands wrapper for better commands
    ../../system/app/flatpak.nix # Flatpak
    ../../system/app/virt-manager.nix # VM Manager
    ../../system/dev/devenv.nix

    # Gaming
    ../../system/app/wine.nix
    ../../system/app/steam.nix
    ../../system/app/gamemode.nix
    ../../system/app/prismlauncher.nix # Minecraft launcher
    ../../system/app/minecraft-server.nix
    ../../system/app/aagl.nix
    ../../system/app/mangohud.nix
  ];

  # Fix nix path
  nix.nixPath = [
    "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
    "nixos-config=$HOME/dotfiles/system/configuration.nix"
    "/nix/var/nix/profiles/per-user/root/channels"
  ];

  # Ensure nix flakes are enabled
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # wheel group gets trusted access to nix daemon
  nix.settings.trusted-users = [ "@wheel" ];

  # Allow Unfree software
  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    useOSProber = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelParams = [
    "amd_pstate=active"
  ];

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  # Networking
  networking.hostName = systemSettings.hostname; # Define your hostname.
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = systemSettings.timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = systemSettings.local;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fishy = {
    isNormalUser = true;
    description = userSettings.username;
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "uinput"
      "libvirtd"
    ];
    packages = [ ];
    uid = 1000;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    zsh
    git
    wpa_supplicant
    ffmpeg
    grub2 # to allow use of the 'grub-reboot' program
    pavucontrol
    pamixer
    cdrtools
  ];

  # Zsh
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  fonts.fontDir.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
