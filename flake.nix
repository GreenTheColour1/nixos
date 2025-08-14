{
  description = "Flakeing";

  outputs =
    {
      denix,
      nixpkgs,
      ...
    }@inputs:
    let
      mkConfigurations =
        moduleSystem:
        denix.lib.configurations rec {
          homeManagerNixpkgs = nixpkgs;
          homeManagerUser = "fishy";
          inherit moduleSystem;
          paths = [
            ./hosts
            ./modules
            ./rices
          ];

          extensions = with denix.lib.extensions; [
            args
            (base.withConfig {
              args.enable = true;

              hosts.features = {
                features = [
                  "cli"
                  "gui"
                  "gaming"
                  "powersave"
                  "wireless"
                ];
                defaultByHostType = {
                  desktop = [
                    "cli"
                    "gui"
                  ];
                  server = [
                    "cli"
                  ];
                };
              };
            })
          ];

          specialArgs = {
            inherit inputs moduleSystem homeManagerUser;
          };
        };

    in
    {
      nixosConfigurations = mkConfigurations "nixos";
      homeConfigurations = mkConfigurations "home";
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

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # wallpapers.url = "git+ssh://git@github.com/GreenTheColour1/wallpapers";

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

    hypr-exiled.url = "github:GreenTheColour1/hypr-exiled";

    greenpkgs.url = "git+ssh://git@github.com/GreenTheColour1/greenpkgs";
    greenpkgs.inputs.nixpkgs.follows = "nixpkgs";

    silentSDDM.url = "github:uiriansan/SilentSDDM";
    silentSDDM.inputs.nixpkgs.follows = "nixpkgs";

    niri-flake.url = "github:sodiboo/niri-flake";
    niri-flake.inputs.nixpkgs.follows = "nixpkgs";
  };
}
