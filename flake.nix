{
  description = "Flakeing";

  outputs =
    inputs@{ self, ... }:
    let
      # ---- SYSTEM SETTINGS ---- #
      systemSettings = {
        system = "x86_64-linux";
        hostname = "nixos-fishy";
        profile = "personal";
        timezone = "America/Toronto";
        local = "en_US.UTF-8";
        gpuType = "nvidia";
      };

      # ----- USER SETTINGS ----- #
      userSettings = rec {
        username = "fishy";
        name = "GreenTheColour1";
        email = "contact@camerongreen.ca"; # email (used for certain configurations)
        dotfilesDir = "~/.dotfiles"; # absolute path of the local repo
        theme = "gruvbox-dark-medium"; # selcted theme from my themes directory (./themes/)
        wm = "hyprland"; # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/
        # window manager type (hyprland or x11) translator
        wmType = if ((wm == "hyprland") || (wm == "plasma")) then "wayland" else "x11";
        browser = "firefox"; # Default browser; must select one from ./user/app/browser/
        term = "kitty"; # Default terminal command;
        font = "FiraCode Nerd Font Mono"; # Selected font
        fontPkg = (pkgs.nerd-fonts.fira-code); # Font package
        editor = "nvim"; # Default editor;
      };

      # configure pkgs
      pkgs-unstable = import inputs.nixpkgs {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
      };

      pkgs-stable = import inputs.nixpkgs-stable {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
      };

      pkgs = pkgs-unstable;

      # configure lib
      lib = inputs.nixpkgs.lib;

      home-manager = inputs.home-manager-unstable;

    in
    # # Systems that can run tests:
    # supportedSystems = [ "x86_64-linux" ];
    #
    # # Function to generate a set based on supported systems:
    # forAllSystems = inputs.nixpkgs.lib.genAttrs supportedSystems;
    #
    # # Attribute set of nixpkgs for each system:
    # nixpkgsFor =
    #   forAllSystems (system: import inputs.nixpkgs { inherit system; });
    {
      homeConfigurations = {
        user = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix")
            # inputs.stylix.homeManagerModules.stylix
          ];
          extraSpecialArgs = {
            inherit pkgs-unstable;
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
          };
        };
      };
      nixosConfigurations = {
        system = lib.nixosSystem {
          system = systemSettings.system;
          modules = [
            (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
            # inputs.stylix.nixosModules.stylix
          ];
          specialArgs = {
            inherit pkgs-unstable;
            inherit pkgs-stable;
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
          };
        };
      };
    };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";

    home-manager-unstable.url = "github:nix-community/home-manager/master";
    home-manager-unstable.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";

    xremap-flake.url = "github:xremap/nix-flake";

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";

    nixcord.url = "github:kaylorben/nixcord";
  };
}
