{
  description = "Flakeing";

  outputs =
    {
      denix,
      nixpkgs,
      ...
    }@inputs:
    let
      # ---- SYSTEM SETTINGS ---- #
      systemSettings = {
        system = "x86_64-linux";
      };

      # ----- USER SETTINGS ----- #
      userSettings = rec {
        username = "fishy";
        name = "GreenTheColour1";
        email = "contact@camerongreen.ca"; # email (used for certain configurations)
      };

      # configure pkgs
      pkgs-unstable = import inputs.nixpkgs {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
        overlays = [
          inputs.nix-vscode-extensions.overlays.default
        ];
      };

      pkgs = pkgs-unstable;

      mkConfigurations =
        isHomeManager:
        denix.lib.configurations {
          homeManagerNixpkgs = pkgs;
          homeManagerUser = "fishy";
          inherit isHomeManager;
          paths = [
            ./hosts
            ./modules
            ./rices
          ];

          specialArgs = {
            inherit inputs;
          };
        };

    in
    {
      nixosConfigurations = mkConfigurations false;
      homeConfigurations = mkConfigurations true;
    };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    denix = {
      url = "github:yunfachi/denix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

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

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };
}
